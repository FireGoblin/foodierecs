require 'spec_helper'

describe "nominations/show.html.erb" do
  before(:each) do
    @nomination = assign(:nomination, stub_model(Nomination,
      :user_id => "",
      :vote => false,
      :voter => "",
      :nominator => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
