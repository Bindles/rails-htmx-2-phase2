require "application_system_test_case"

class WheelcolorsTest < ApplicationSystemTestCase
  setup do
    @wheelcolor = wheelcolors(:one)
  end

  test "visiting the index" do
    visit wheelcolors_url
    assert_selector "h1", text: "Wheelcolors"
  end

  test "should create wheelcolor" do
    visit wheelcolors_url
    click_on "New wheelcolor"

    fill_in "Name", with: @wheelcolor.name
    fill_in "Value", with: @wheelcolor.value
    click_on "Create Wheelcolor"

    assert_text "Wheelcolor was successfully created"
    click_on "Back"
  end

  test "should update Wheelcolor" do
    visit wheelcolor_url(@wheelcolor)
    click_on "Edit this wheelcolor", match: :first

    fill_in "Name", with: @wheelcolor.name
    fill_in "Value", with: @wheelcolor.value
    click_on "Update Wheelcolor"

    assert_text "Wheelcolor was successfully updated"
    click_on "Back"
  end

  test "should destroy Wheelcolor" do
    visit wheelcolor_url(@wheelcolor)
    click_on "Destroy this wheelcolor", match: :first

    assert_text "Wheelcolor was successfully destroyed"
  end
end
