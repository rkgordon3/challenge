require 'spec_helper'

describe "challengers/show" do
  before(:each) do
    @challenger = assign(:challenger, stub_model(Challenger,
      :name => "Name",
      :email => "Email",
      :in => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/false/)
  end
end
