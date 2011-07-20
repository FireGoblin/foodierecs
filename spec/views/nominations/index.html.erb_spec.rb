require 'spec_helper'

describe "nominations/index.html.erb" do
  before(:each) do
    assign(:nominations, [
      stub_model(Nomination,
        :user_id => "",
        :vote => false,
        :voter => "",
        :nominator => false
      ),
      stub_model(Nomination,
        :user_id => "",
        :vote => false,
        :voter => "",
        :nominator => false
      )
    ])
  end

  it "renders a list of nominations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
