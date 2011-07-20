require 'spec_helper'

describe "mappings/edit.html.erb" do
  before(:each) do
    @mapping = assign(:mapping, stub_model(Mapping,
      :restaurant_id1 => "",
      :restaurant_id2 => "",
      :foodies => "",
      :nonfoodie => ""
    ))
  end

  it "renders the edit mapping form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => mappings_path(@mapping), :method => "post" do
      assert_select "input#mapping_restaurant_id1", :name => "mapping[restaurant_id1]"
      assert_select "input#mapping_restaurant_id2", :name => "mapping[restaurant_id2]"
      assert_select "input#mapping_foodies", :name => "mapping[foodies]"
      assert_select "input#mapping_nonfoodie", :name => "mapping[nonfoodie]"
    end
  end
end
