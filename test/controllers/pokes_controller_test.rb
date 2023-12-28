require "test_helper"

class PokesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @poke = pokes(:one)
  end

  test "should get index" do
    get pokes_url
    assert_response :success
  end

  test "should get new" do
    get new_poke_url
    assert_response :success
  end

  test "should create poke" do
    assert_difference("Poke.count") do
      post pokes_url, params: { poke: { category: @poke.category, name: @poke.name, url: @poke.url } }
    end

    assert_redirected_to poke_url(Poke.last)
  end

  test "should show poke" do
    get poke_url(@poke)
    assert_response :success
  end

  test "should get edit" do
    get edit_poke_url(@poke)
    assert_response :success
  end

  test "should update poke" do
    patch poke_url(@poke), params: { poke: { category: @poke.category, name: @poke.name, url: @poke.url } }
    assert_redirected_to poke_url(@poke)
  end

  test "should destroy poke" do
    assert_difference("Poke.count", -1) do
      delete poke_url(@poke)
    end

    assert_redirected_to pokes_url
  end
end
