require 'spec_helper'

describe "challengers/new" do
  before(:each) do
    assign(:challenger, stub_model(Challenger,
      :name => "MyString",
      :email => "MyString",
      :in => false
    ).as_new_record)
  end

  it "renders new challenger form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => challengers_path, :method => "post" do
      assert_select "input#challenger_name", :name => "challenger[name]"
      assert_select "input#challenger_email", :name => "challenger[email]"
      assert_select "input#challenger_in", :name => "challenger[in]"
    end
  end
end
