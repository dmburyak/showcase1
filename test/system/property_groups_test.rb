require "application_system_test_case"

class PropertyGroupsTest < ApplicationSystemTestCase
  setup do
    @property_group = property_groups(:one)
  end

  test "visiting the index" do
    visit property_groups_url
    assert_selector "h1", text: "Property groups"
  end

  test "should create property group" do
    visit property_groups_url
    click_on "New property group"

    fill_in "Name", with: @property_group.name
    click_on "Create Property group"

    assert_text "Property group was successfully created"
    click_on "Back"
  end

  test "should update Property group" do
    visit property_group_url(@property_group)
    click_on "Edit this property group", match: :first

    fill_in "Name", with: @property_group.name
    click_on "Update Property group"

    assert_text "Property group was successfully updated"
    click_on "Back"
  end

  test "should destroy Property group" do
    visit property_group_url(@property_group)
    click_on "Destroy this property group", match: :first

    assert_text "Property group was successfully destroyed"
  end
end
