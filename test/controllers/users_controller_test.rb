require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get user_list_url
    assert_response :success
  end

  test "should get me" do
    get me_url
    assert_response :success
  end
end
