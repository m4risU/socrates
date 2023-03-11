require 'rails_helper'

RSpec.describe "webhooks/index", type: :view do
  before(:each) do
    assign(:webhooks, [
      Webhook.create!(
        url: "Url",
        name: "Name",
        event: "Event"
      ),
      Webhook.create!(
        url: "Url",
        name: "Name",
        event: "Event"
      )
    ])
  end

  it "renders a list of webhooks" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Url".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Event".to_s), count: 2
  end
end
