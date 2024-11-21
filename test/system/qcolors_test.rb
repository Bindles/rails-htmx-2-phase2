require "application_system_test_case"

class QcolorsTest < ApplicationSystemTestCase
  setup do
    @qcolor = qcolors(:one)
  end

  test "visiting the index" do
    visit qcolors_url
    assert_selector "h1", text: "Qcolors"
  end

  test "should create qcolor" do
    visit qcolors_url
    click_on "New qcolor"

    fill_in "Name", with: @qcolor.name
    fill_in "Value", with: @qcolor.value
    click_on "Create Qcolor"

    assert_text "Qcolor was successfully created"
    click_on "Back"
  end

  test "should update Qcolor" do
    visit qcolor_url(@qcolor)
    click_on "Edit this qcolor", match: :first

    fill_in "Name", with: @qcolor.name
    fill_in "Value", with: @qcolor.value
    click_on "Update Qcolor"

    assert_text "Qcolor was successfully updated"
    click_on "Back"
  end

  test "should destroy Qcolor" do
    visit qcolor_url(@qcolor)
    click_on "Destroy this qcolor", match: :first

    assert_text "Qcolor was successfully destroyed"
  end
end
