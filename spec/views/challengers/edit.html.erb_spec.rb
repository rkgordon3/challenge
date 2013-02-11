require 'spec_helper'

describe "challengers/edit" do
  before(:each) do
    @challenger = assign(:challenger, stub_model(Challenger,
      :name => "MyString",
      :email => "MyString",
      :in => false
    ))
  end

  it "renders the edit challenger form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => challengers_path(@challenger), :method => "post" do
      assert_select "input#challenger_name", :name => "challenger[name]"
      assert_select "input#challenger_email", :name => "challenger[email]"
      assert_select "input#challenger_in", :name => "challenger[in]"
    end
  end
end
