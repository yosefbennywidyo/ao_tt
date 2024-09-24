require "application_system_test_case"

class DeviseAuthSystemTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "sign in existing user" do
    sign_in user

    visit new_user_session_path
    assert_current_path new_user_session_path
    assert_text "Find me in app/views/static/dashboard.html.erb"
  end

  test "create user and sign in" do
    visit new_user_session_path
    assert_current_path new_user_session_path

    fill_in "Username", with: "email_test"
    fill_in "Email", with: "email@test.com"
    fill_in "Password", with: "new_password"
    click_button "Log in"

    assert_current_path me_path
    assert_text "Signed in successfully."
  end
end
