require 'rails_helper'

RSpec.describe "trails/edit", type: :view do
  before(:each) do
    @trail = assign(:trail, Trail.create!(
      :name => "MyString",
      :nature => "MyString",
      :difficulty => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders the edit trail form" do
    render

    assert_select "form[action=?][method=?]", trail_path(@trail), "post" do

      assert_select "input#trail_name[name=?]", "trail[name]"

      assert_select "input#trail_nature[name=?]", "trail[nature]"

      assert_select "input#trail_difficulty[name=?]", "trail[difficulty]"

      assert_select "input#trail_latitude[name=?]", "trail[latitude]"

      assert_select "input#trail_longitude[name=?]", "trail[longitude]"
    end
  end
end
