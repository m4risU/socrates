require 'rails_helper'

RSpec.describe "accounts/edit", type: :view do
  let(:account) {
    Account.create!(
      first_name: "MyString",
      last_name: "MyString",
      nickname: "MyString",
      email: "MyString"
    )
  }

  before(:each) do
    assign(:account, account)
  end

  it "renders the edit account form" do
    render

    assert_select "form[action=?][method=?]", account_path(account), "post" do

      assert_select "input[name=?]", "account[first_name]"

      assert_select "input[name=?]", "account[last_name]"

      assert_select "input[name=?]", "account[nickname]"

      assert_select "input[name=?]", "account[email]"
    end
  end
end
