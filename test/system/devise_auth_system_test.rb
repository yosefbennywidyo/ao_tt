require "application_system_test_case"

class DeviseAuthSystemTest < ApplicationSystemTestCase
  test "registered user automatically sign in" do
    visit new_user_registration_path
    assert_current_path new_user_registration_path

    fill_in "Username", with: "email_test"
    fill_in "Email", with: "email@test.com"
    fill_in "First name", with: "first"
    fill_in "Last name", with: "last"
    fill_in "Password", with: "new_password"
    fill_in "Password confirmation", with: "new_password"
    click_button "Sign up"

    assert_text "Welcome! You have signed up successfully."
    assert_current_path me_path
  end
end
