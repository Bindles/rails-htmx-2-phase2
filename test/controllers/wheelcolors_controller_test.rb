require "test_helper"

class WheelcolorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wheelcolor = wheelcolors(:one)
  end

  test "should get index" do
    get wheelcolors_url
    assert_response :success
  end

  test "should get new" do
    get new_wheelcolor_url
    assert_response :success
  end

  test "should create wheelcolor" do
    assert_difference("Wheelcolor.count") do
      post wheelcolors_url, params: { wheelcolor: { name: @wheelcolor.name, value: @wheelcolor.value } }
    end

    assert_redirected_to wheelcolor_url(Wheelcolor.last)
  end

  test "should show wheelcolor" do
    get wheelcolor_url(@wheelcolor)
    assert_response :success
  end

  test "should get edit" do
    get edit_wheelcolor_url(@wheelcolor)
    assert_response :success
  end

  test "should update wheelcolor" do
    patch wheelcolor_url(@wheelcolor), params: { wheelcolor: { name: @wheelcolor.name, value: @wheelcolor.value } }
    assert_redirected_to wheelcolor_url(@wheelcolor)
  end

  test "should destroy wheelcolor" do
    assert_difference("Wheelcolor.count", -1) do
      delete wheelcolor_url(@wheelcolor)
    end

    assert_redirected_to wheelcolors_url
  end
end
