require 'rails_helper'

RSpec.describe "test_cycles/show", type: :view do
  before(:each) do
    assign(:test_cycle, TestCycle.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
