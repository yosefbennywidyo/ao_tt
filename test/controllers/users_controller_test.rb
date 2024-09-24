require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    sign_in @user
    get user_list_url
    assert_response :success
  end

  test "should get me" do
    sign_in @user
    get me_url
    assert_response :success
  end
end
