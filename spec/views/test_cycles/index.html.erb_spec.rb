require 'rails_helper'

RSpec.describe "test_cycles/index", type: :view do
  before(:each) do
    assign(:test_cycles, [
      TestCycle.create!(
        name: "Name"
      ),
      TestCycle.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of test_cycles" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
