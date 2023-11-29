require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get login" do
    get pages_login_url
    assert_response :success
  end

  test "should get register" do
    get pages_register_url
    assert_response :success
  end

  test "should get invitations" do
    get pages_invitations_url
    assert_response :success
  end

  test "should get transactions" do
    get pages_transactions_url
    assert_response :success
  end
end
