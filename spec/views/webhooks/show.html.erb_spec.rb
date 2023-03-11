require 'rails_helper'

RSpec.describe "webhooks/show", type: :view do
  before(:each) do
    assign(:webhook, Webhook.create!(
      url: "Url",
      name: "Name",
      event: "Event",
      secret: "Secret"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Event/)
  end
end
