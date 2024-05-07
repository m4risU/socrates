require 'rails_helper'

RSpec.describe "test_cycles/edit", type: :view do
  let(:test_cycle) {
    TestCycle.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:test_cycle, test_cycle)
  end

  it "renders the edit test_cycle form" do
    render

    assert_select "form[action=?][method=?]", test_cycle_path(test_cycle), "post" do

      assert_select "input[name=?]", "test_cycle[name]"
    end
  end
end
