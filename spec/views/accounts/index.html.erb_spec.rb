require 'rails_helper'

RSpec.describe "accounts/index", type: :view do
  before(:each) do
    assign(:accounts, [
      Account.create!(
        first_name: "First Name",
        last_name: "Last Name",
        nickname: "Nickname",
        email: "Email"
      ),
      Account.create!(
        first_name: "First Name",
        last_name: "Last Name",
        nickname: "Nickname",
        email: "Email"
      )
    ])
  end

  it "renders a list of accounts" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Nickname".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
  end
end
