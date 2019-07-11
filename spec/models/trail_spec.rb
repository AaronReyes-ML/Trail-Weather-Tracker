require 'rails_helper'

RSpec.describe Trail, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
  
  #because this search can take ALL types of search values, "valid attributes" is just so we can mockup a searched value
  #created spec/factories/trails_model_factory.rb
  #currently, the factory is briefly defined
    let(:valid_attributes) {
    {:name => "name", :nature => "nature", :difficulty => "difficulty", :latitude => 38.989055, :longitude => -104.898360, :comment => "", :note => ""}
  }
  
  describe Trail do
    it 'can limit by search' do
      trail = Trail.create!({:name => "name1", :nature => "nature", :difficulty => "difficulty", :latitude => 38.989055, :longitude => -104.898360, :comment => "", :note => ""})
      trail = Trail.create!({:name => "name2", :nature => "nature", :difficulty => "difficulty", :latitude => 38.989055, :longitude => -104.898361, :comment => "", :note => ""})
      find_one = Trail.search("name1")
      expect(find_one.count).to eq(1)
    end
    it 'can find all' do
      trail = Trail.create!({:name => "name1", :nature => "nature", :difficulty => "difficulty", :latitude => 38.989055, :longitude => -104.898360, :comment => "", :note => ""})
      trail = Trail.create!({:name => "name2", :nature => "nature", :difficulty => "difficulty", :latitude => 38.989055, :longitude => -104.898361, :comment => "", :note => ""})
      find_all = Trail.all
      expect(find_all.count).to eq(2)
    end
  end
end
