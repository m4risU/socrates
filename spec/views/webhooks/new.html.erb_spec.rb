require 'rails_helper'

RSpec.describe "webhooks/new", type: :view do
  before(:each) do
    assign(:webhook, Webhook.new(
      url: "MyString",
      name: "MyString",
      event: "MyString"
    ))
  end

  it "renders new webhook form" do
    render

    assert_select "form[action=?][method=?]", webhooks_path, "post" do

      assert_select "input[name=?]", "webhook[url]"

      assert_select "input[name=?]", "webhook[name]"

      assert_select "input[name=?]", "webhook[event]"
    end
  end
end
