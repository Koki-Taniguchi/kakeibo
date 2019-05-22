require "application_system_test_case"

class RecodesTest < ApplicationSystemTestCase
  setup do
    @recode = recodes(:one)
  end

  test "visiting the index" do
    visit recodes_url
    assert_selector "h1", text: "Recodes"
  end

  test "creating a Recode" do
    visit recodes_url
    click_on "New Recode"

    fill_in "Category", with: @recode.category
    fill_in "Date", with: @recode.date
    fill_in "Name", with: @recode.name
    click_on "Create Recode"

    assert_text "Recode was successfully created"
    click_on "Back"
  end

  test "updating a Recode" do
    visit recodes_url
    click_on "Edit", match: :first

    fill_in "Category", with: @recode.category
    fill_in "Date", with: @recode.date
    fill_in "Name", with: @recode.name
    click_on "Update Recode"

    assert_text "Recode was successfully updated"
    click_on "Back"
  end

  test "destroying a Recode" do
    visit recodes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recode was successfully destroyed"
  end
end
