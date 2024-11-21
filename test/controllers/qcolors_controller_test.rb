require "test_helper"

class QcolorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @qcolor = qcolors(:one)
  end

  test "should get index" do
    get qcolors_url
    assert_response :success
  end

  test "should get new" do
    get new_qcolor_url
    assert_response :success
  end

  test "should create qcolor" do
    assert_difference("Qcolor.count") do
      post qcolors_url, params: { qcolor: { name: @qcolor.name, value: @qcolor.value } }
    end

    assert_redirected_to qcolor_url(Qcolor.last)
  end

  test "should show qcolor" do
    get qcolor_url(@qcolor)
    assert_response :success
  end

  test "should get edit" do
    get edit_qcolor_url(@qcolor)
    assert_response :success
  end

  test "should update qcolor" do
    patch qcolor_url(@qcolor), params: { qcolor: { name: @qcolor.name, value: @qcolor.value } }
    assert_redirected_to qcolor_url(@qcolor)
  end

  test "should destroy qcolor" do
    assert_difference("Qcolor.count", -1) do
      delete qcolor_url(@qcolor)
    end

    assert_redirected_to qcolors_url
  end
end
