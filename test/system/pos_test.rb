require "application_system_test_case"

class PosTest < ApplicationSystemTestCase
  setup do
    @po = pos(:one)
  end

  test "visiting the index" do
    visit pos_url
    assert_selector "h1", text: "Pos"
  end

  test "should create po" do
    visit pos_url
    click_on "New po"

    fill_in "Name", with: @po.name
    fill_in "Url", with: @po.url
    click_on "Create Po"

    assert_text "Po was successfully created"
    click_on "Back"
  end

  test "should update Po" do
    visit po_url(@po)
    click_on "Edit this po", match: :first

    fill_in "Name", with: @po.name
    fill_in "Url", with: @po.url
    click_on "Update Po"

    assert_text "Po was successfully updated"
    click_on "Back"
  end

  test "should destroy Po" do
    visit po_url(@po)
    click_on "Destroy this po", match: :first

    assert_text "Po was successfully destroyed"
  end
end
