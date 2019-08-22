require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reviews_new_url
    assert_response :success
  end

  test "should get create" do
    get reviews_create_url
    assert_response :success
  end

  test "should get edit" do
    get reviews_edit_url
    assert_response :success
  end

  test "should get update" do
    get reviews_update_url
    assert_response :success
  end

  test "should get delete" do
    get reviews_delete_url
    assert_response :success
  end

end
