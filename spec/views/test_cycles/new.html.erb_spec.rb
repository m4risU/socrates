require 'rails_helper'

RSpec.describe "test_cycles/new", type: :view do
  before(:each) do
    assign(:test_cycle, TestCycle.new(
      name: "MyString"
    ))
  end

  it "renders new test_cycle form" do
    render

    assert_select "form[action=?][method=?]", test_cycles_path, "post" do

      assert_select "input[name=?]", "test_cycle[name]"
    end
  end
end
