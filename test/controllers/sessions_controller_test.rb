require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get login page" do
    get login_url
    assert_response :success
  end

  test "should log a user in" do
    post sessions_path, params: { :username => (@user.username), :password => 'secret' }
    assert_redirected_to root_url
  end

  test "should log a user out" do
    get logout_url
    assert_redirected_to root_url
  end
end
