require 'spec_helper'

describe "challengers/index" do
  before(:each) do
    assign(:challengers, [
      stub_model(Challenger,
        :name => "Name",
        :email => "Email",
        :in => false
      ),
      stub_model(Challenger,
        :name => "Name",
        :email => "Email",
        :in => false
      )
    ])
  end

  it "renders a list of challengers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
