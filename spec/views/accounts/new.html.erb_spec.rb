require 'rails_helper'

RSpec.describe "accounts/new", type: :view do
  before(:each) do
    assign(:account, Account.new(
      first_name: "MyString",
      last_name: "MyString",
      nickname: "MyString",
      email: "MyString"
    ))
  end

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do

      assert_select "input[name=?]", "account[first_name]"

      assert_select "input[name=?]", "account[last_name]"

      assert_select "input[name=?]", "account[nickname]"

      assert_select "input[name=?]", "account[email]"
    end
  end
end
