require "application_system_test_case"

class Intervention2sTest < ApplicationSystemTestCase
  setup do
    @intervention2 = intervention2s(:one)
  end

  test "visiting the index" do
    visit intervention2s_url
    assert_selector "h1", text: "Intervention2s"
  end

  test "creating a Intervention2" do
    visit intervention2s_url
    click_on "New Intervention2"

    fill_in "Column", with: @intervention2.column_id
    click_on "Create Intervention2"

    assert_text "Intervention2 was successfully created"
    click_on "Back"
  end

  test "updating a Intervention2" do
    visit intervention2s_url
    click_on "Edit", match: :first

    fill_in "Column", with: @intervention2.column_id
    click_on "Update Intervention2"

    assert_text "Intervention2 was successfully updated"
    click_on "Back"
  end

  test "destroying a Intervention2" do
    visit intervention2s_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Intervention2 was successfully destroyed"
  end
end
