require "application_system_test_case"

class PokesTest < ApplicationSystemTestCase
  setup do
    @poke = pokes(:one)
  end

  test "visiting the index" do
    visit pokes_url
    assert_selector "h1", text: "Pokes"
  end

  test "should create poke" do
    visit pokes_url
    click_on "New poke"

    fill_in "Category", with: @poke.category
    fill_in "Name", with: @poke.name
    fill_in "Url", with: @poke.url
    click_on "Create Poke"

    assert_text "Poke was successfully created"
    click_on "Back"
  end

  test "should update Poke" do
    visit poke_url(@poke)
    click_on "Edit this poke", match: :first

    fill_in "Category", with: @poke.category
    fill_in "Name", with: @poke.name
    fill_in "Url", with: @poke.url
    click_on "Update Poke"

    assert_text "Poke was successfully updated"
    click_on "Back"
  end

  test "should destroy Poke" do
    visit poke_url(@poke)
    click_on "Destroy this poke", match: :first

    assert_text "Poke was successfully destroyed"
  end
end
