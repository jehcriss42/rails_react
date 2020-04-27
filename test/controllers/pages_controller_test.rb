require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get 'http://localhost:3000/'
    assert_response :success
  end

  test "should not get my_todo_items" do
    get 'http://localhost:3000/api/v1/todo_items'
    assert_response 401
  end

end
