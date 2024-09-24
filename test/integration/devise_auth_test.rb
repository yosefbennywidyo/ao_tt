class DeviseAuthTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "unauthenticated user can visit home page" do
    get root_path
    assert_response :success
  end

  test "unauthenticated user can't visit user list" do
    get user_list_path
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "unauthenticated user can't visit me page" do
    get me_path
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "authenticated user can visit user list" do
    sign_in @user
    get user_list_path
    assert_response :success
  end

  test "authenticated user can visit me page" do
    sign_in @user
    get me_path
    assert_response :success
  end
end
