# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

trails = [{:name => "Stanely Canyon Resevoir Trailhead", :nature => "hike", :difficulty => "medium", :latitude => 38.989055, :longitude => -104.898360},
          {:name => "Red Rock Canyon Open Space Trailhead",   :nature => "walk", :difficulty => "easy", :latitude => 38.851793, :longitude => -104.878284},
          {:name => "Palmer Point Trailhead",            :nature => "walk", :difficulty => "easy",   :latitude => 38.887530, :longitude => -104.773365},
          {:name => "UCCS Pedestrian Spine",            :nature => "walk", :difficulty => "easy",   :latitude => 38.892184, :longitude => -104.797949}]

trails.each do |trail|
    Trail.create!(trail)
end
