require "test_helper"

class Public::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_users_edit_url
    assert_response :success
  end

  test "should get confirm_withdrawal" do
    get public_users_confirm_withdrawal_url
    assert_response :success
  end

  test "should get new" do
    get public_users_new_url
    assert_response :success
  end
end
