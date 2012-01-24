require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "should get agenda" do
    get :agenda
    assert_response :success
  end

  test "should get contest" do
    get :contest
    assert_response :success
  end

  test "should get faq" do
    get :faq
    assert_response :success
  end

  test "should get info" do
    get :info
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

  test "should get sessions" do
    get :sessions
    assert_response :success
  end

  test "should get sign_in" do
    get :sign_in
    assert_response :success
  end

end
