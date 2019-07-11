#spec/factories/trails_model_factory.rb
#require 'Faker' -- this will allow for randomized names (can be made unique upon call)

FactoryGirl.define do

    factory :trail do #|t|
        name "UCCS Pedestrian Spine"
        # t.name Faker::Name.name //this throws an error
    end
    
    factory :search do
        search "UCCS"
    end
end
    
#     factory :nullSearch do
#         nullSearch ""
#     end
    
#     factory :noMatchSearch do
#         noMatchSearch "1!#!@#@#$*$&*!$&!"
#     end
# end