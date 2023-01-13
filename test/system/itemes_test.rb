require "application_system_test_case"

class ItemesTest < ApplicationSystemTestCase
  setup do
    @iteme = itemes(:one)
  end

  test "visiting the index" do
    visit itemes_url
    assert_selector "h1", text: "Itemes"
  end

  test "should create iteme" do
    visit itemes_url
    click_on "New iteme"

    fill_in "Category", with: @iteme.category_id
    fill_in "Description", with: @iteme.description
    fill_in "Name", with: @iteme.name
    fill_in "Price", with: @iteme.price
    fill_in "Property", with: @iteme.property_id
    fill_in "Seller", with: @iteme.seller_id
    fill_in "Subcatogory", with: @iteme.subcatogory_id
    fill_in "Url", with: @iteme.url
    click_on "Create Iteme"

    assert_text "Iteme was successfully created"
    click_on "Back"
  end

  test "should update Iteme" do
    visit iteme_url(@iteme)
    click_on "Edit this iteme", match: :first

    fill_in "Category", with: @iteme.category_id
    fill_in "Description", with: @iteme.description
    fill_in "Name", with: @iteme.name
    fill_in "Price", with: @iteme.price
    fill_in "Property", with: @iteme.property_id
    fill_in "Seller", with: @iteme.seller_id
    fill_in "Subcatogory", with: @iteme.subcatogory_id
    fill_in "Url", with: @iteme.url
    click_on "Update Iteme"

    assert_text "Iteme was successfully updated"
    click_on "Back"
  end

  test "should destroy Iteme" do
    visit iteme_url(@iteme)
    click_on "Destroy this iteme", match: :first

    assert_text "Iteme was successfully destroyed"
  end
end
