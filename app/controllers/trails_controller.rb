class TrailsController < ApplicationController
  include ActionView::Helpers::DateHelper
  before_action :set_trail, only: [:show, :edit, :update, :destroy]

  # GET /trails
  # GET /trails.json
  def index
    @trails = Trail.all
   
    #this is only to update the database when necessary
    #if (params[:debug] == "get_trails")then
      #@trails.each do |trail|
        #trail.delete
      #end
      #raw_response = get_trails();
      #places = raw_response["places"]
      #places.each do |place|
        #activityhash = place["activities"][0]
        #if(place["lat"] < 38.629451 || place["lon"] > -104.496141 || place["lat"] > 39.169331 || place["lon"] < -105.391381)then
          
        #else
         #Trail.create({:name => activityhash["name"], :nature => "hike", :difficulty => activityhash["length"].to_s, :latitude => place["lat"], :longitude => place["lon"], :comment => "", :note => activityhash["description"]})
        #end
      #end
    #end
    
    #return value of 0 = just trails
    #retunr value of 1 = just infoboxes
    #return value of 2 = both infoboxes and weather circles
    @map_features = get_map_features(params[:map_features])

    #these variables house the on-map weather display details
    #if they are empty, then no weather circles will be put on the map
    @weather_count = 0
    @weather_circles_count = 0
    @snow_array = Array.new
    @rain_array = Array.new
    @fog_array = Array.new
    
    #puts each trail onto the map
    @markers = Gmaps4rails.build_markers(@trails) do |trail, marker|
    marker.lat trail.latitude
    marker.lng trail.longitude
    marker.picture({"url" => view_context.image_path(trail.nature+'.png'), "width" => 32, "height" => 47})
    
    #If you want to see any weather details at all, show_me_weather should be true
    if (@map_features > 0) then
      
    trailweather = get_weather(trail.latitude, trail.longitude)
      
      #in the event of an API Misshap, don't attempt to proceed
      if (trailweather["currentobservation"].nil? || trailweather == "GPS location out of bounds" || trailweather.nil?)then
          marker.infowindow '<div><center>' + trail.name + '</center>
                      <table id ="' + trail.name + '_weather_infobox"><center>
                        <th>Overview</th>
                        <th>Now</th>
                        <tr>
                        <td>Weather API Error, please try again later</td>
                        </tr>
                      </table>
                      </center>
                      </div>'
      else
    
        now = trailweather["currentobservation"]
        data = trailweather["data"]
        weekimage = data["iconLink"]
        weektemp = data["temperature"]
        weekweather = data["weather"]
        
        #wind is often reporting 999 degrees, thats probably not right, so I added this
        if now["Windd"].to_i > 360 || now["Windd"].to_i < 0 then
          now["Windd"] = "N/A"
        end
    
        #If you want to see weather overlaid on the map, show_me_weather should be true
        if (@map_features == 2) then
          weather_code = get_inclimate(weekweather[0])
          if weather_code == 0 then
            @snow_array.push({"lat" => trail.latitude, "lng" => trail.longitude, "radius" => 2500})
          elsif weather_code == 1 then
            @rain_array.push({"lat" => trail.latitude, "lng" => trail.longitude, "radius" => 2500})
          elsif weather_code == 2 then
          @fog_array.push({"lat" => trail.latitude, "lng" => trail.longitude, "radius" => 2500})
          end
        end
    
        marker.infowindow '<div><center>' + trail.name + '</center>
                      <table id ="' + trail.name + '_weather_infobox"><center>
                        <th>Overview</th>
                        <th>Now</th>
                        <tr>
                        <td>
                          <table>
                          <tr><td><img src='+ weekimage[0] +' style="width:150px;height:125px;"></td></tr>
                          <tr><td>C: ' +    now["Temp"] +'&deg, ' + weektemp[0] + '&deg / ' + weektemp[1] + '&deg</td></tr>
                          </table>
                        </td>
                          <td>
                            <table>
                              <tr><td>' +  weekweather[0] + '</td></tr>
                              <tr><td>Humidity: ' +  now["Relh"] + '</td></tr>
                              <tr><td>Visibility: ' +  now["Visibility"] + 'mi</td></tr>
                              <tr><td>' +  now["Date"] + '</td></tr>
                              <td>Wind: ' + now["Winds"] + 'mph by ' + now["Windd"] + '&deg</td>
                              <tr><td><a href="'+ trail_path(trail) +'">More Info</a></td></tr>
                            </table>
                          </td>
                        </tr>
                      </table>
                      </center>
                      </div>'
          @weather_count += 1
      end
      
    else
      #for when no weather details are desired, this simply puts the name instead
      marker.infowindow '<a href="'+ trail_path(trail) +'"> ' + trail.name + '</a>'
    end
    
    if(params[:search])then
      @trails_search_data = Trail.search(params[:search])
    else
      @trails_search_data = []
    end
    
    #how many weather circles are there
    @weather_circles_count = @snow_array.count + @rain_array.count + @fog_array.count
    end
  end
  
  # this function returns a hash that looks like this http://forecast.weather.gov/MapClick.php?lat=38.989055&lon=-104.898360&FcstType=json
  def get_weather lat,long
    if (lat.to_f < 38.629451 || long.to_f > -104.496141 || lat.to_f > 39.169331 || long.to_f < -105.391381)then
      return "GPS location out of bounds"
    else
    address = "http://forecast.weather.gov/MapClick.php?lat=" + lat.to_s + "&lon=" + long.to_s + "&FcstType=json";
    weather = HTTP.get(address)
    weatherhash = JSON.parse(weather)
    return weatherhash
    end
  end
  
  #this function doesn't actually get called anymore, its just there to update the db when necessary.
  #def get_trails
    #response = Unirest.get "https://trailapi-trailapi.p.mashape.com/?limit=80&q[activities_activity_type_name_eq]=hiking&q[city_cont]=Colorado+Springs&radius=80",headers:{"X-Mashape-Key" => "ktoxroBJpimshiVYcNS5rEJ2BuS3p1wGr2Fjsn5tnV3C0tYu87","Accept" => "text/plain"}
    #trails = response.body
    #return trails
  #end
  
  #for now this is useless
  #def has_been_an_hour last_updated
    #one_hour = ((60.minutes).to_formatted_s(:number)).to_i
    #one_hour_after = (last_updated).to_i + (one_hour).to_i
    #now = ((Time.now).to_formatted_s(:number)).to_i
    
    #if (now > one_hour_after)then
    #  return true
    #else
      #return false
    #end
  #end
  
  # 0 = snow, 1 = rain, 2 = fog, -1 = nothing in particular
  def get_inclimate currentweather
    currentweather = currentweather.to_s
    if currentweather.match(/snow/i) then
      return 0
    elsif currentweather.match(/rain/i) || currentweather.match(/thunder/i) || currentweather.match(/lightning/i) then
      return 1
    elsif currentweather.match(/fog/i) then
      return 2
    else
      return -1
    end
  end
  
  def get_map_features features_controll
    if(features_controll)then
      if(features_controll == "trails_only")then
        return 0
      elsif(features_controll == "weather_details")then
        return 1
      elsif(features_controll == "weather_details_plusoverlay")then
        return 2
      end
    else
      return 0
    end
  end

  # GET /trails/1c
  # GET /trails/1.json
  def show
    @trails = @trail
    @snow_array = Array.new
    @rain_array = Array.new
    @fog_array = Array.new
    
    if params[:debug] == "delete_comments" then
      @trail.update(comment: "")
    end
    
    trailweather = get_weather(@trail.latitude, @trail.longitude)
    @now = trailweather["currentobservation"]
    @data = trailweather["data"]
    @time = trailweather["time"]
    @weekimage = @data["iconLink"]
    @weektemp = @data["temperature"]
    @weekweather = @data["weather"]
    #raw_hazard = @data["hazardUrl"]
    #@hazardoutlook = raw_hazard[0].gsub(/amp;/, "")
    #@hazardoutlook2 = raw_hazard[1].gsub(/amp;/, "")
    
    @markers = Gmaps4rails.build_markers(@trails) do |trail, marker|
    marker.lat trail.latitude
    marker.lng trail.longitude
    marker.picture({"url" => view_context.image_path(trail.nature+'.png'), "width" => 32, "height" => 47})
    @weather_code = get_inclimate(@weekweather[0])
      if @weather_code == 0 then
        @snow_array.push({"lat" => trail.latitude, "lng" => trail.longitude, "radius" => 2500})
      elsif @weather_code == 1 then
        @rain_array.push({"lat" => trail.latitude, "lng" => trail.longitude, "radius" => 2500})
      elsif @weather_code == 2 then
        @fog_array.push({"lat" => trail.latitude, "lng" => trail.longitude, "radius" => 2500})
      end
    end
    if params[:comment] then
      new_comment = params[:comment].to_s
      if (new_comment != "")then
      @trail.update(comment: @trail.comment + '///' + Time.now.to_s + ' ' + new_comment + ' ')
      end
    end
    @all_comments = @trail.comment.split("///")
  end

  # GET /trails/new
  def new
    @trail = Trail.new
  end

  # GET /trails/1/edit
  def edit
  end

  # POST /trails
  # POST /trails.json
  def create
    @trail = Trail.new(trail_params)

    respond_to do |format|
      if @trail.save
        format.html { redirect_to @trail, notice: 'Trail was successfully created.' }
        format.json { render :show, status: :created, location: @trail }
      else
        format.html { render :new }
        format.json { render json: @trail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trails/1
  # PATCH/PUT /trails/1.json
  def update
    respond_to do |format|
      if @trail.update(trail_params)
        format.html { redirect_to @trail, notice: 'Trail was successfully updated.' }
        format.json { render :show, status: :ok, location: @trail }
      else
        format.html { render :edit }
        format.json { render json: @trail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trails/1
  # DELETE /trails/1.json
  def destroy
    @trail.destroy
    respond_to do |format|
      format.html { redirect_to trails_url, notice: 'Trail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def login
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trail
      @trail = Trail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trail_params
      params.require(:trail).permit(:name, :nature, :difficulty, :latitude, :longitude)
    end
    
end