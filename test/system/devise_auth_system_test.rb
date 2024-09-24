require "application_system_test_case"

class DeviseAuthSystemTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "sign in existing user" do
    sign_in @user

    assert_text "Find me in app/views/users/me.html.erb"
  end

  test "create user and sign in" do
    visit new_user_session_path
    assert_current_path new_user_session_path

    fill_in "Username", with: "email_test"
    fill_in "Email", with: "email@test.com"
    fill_in "Password", with: "new_password"
    fill_in "Password confirmation", with: "new_password"
    click_button "Sign up"

    assert_text "Welcome! You have signed up successfully."
    assert_current_path me_path
  end
end
