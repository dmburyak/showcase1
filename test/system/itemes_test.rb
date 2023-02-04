require "application_system_test_case"

class phoneesTest < ApplicationSystemTestCase
  setup do
    @phonee = phonees(:one)
  end

  test "visiting the index" do
    visit phonees_url
    assert_selector "h1", text: "phonees"
  end

  test "should create phonee" do
    visit phonees_url
    click_on "New phonee"

    fill_in "Category", with: @phonee.category_id
    fill_in "Description", with: @phonee.description
    fill_in "Name", with: @phonee.name
    fill_in "Price", with: @phonee.price
    fill_in "Property", with: @phonee.property_id
    fill_in "Seller", with: @phonee.seller_id
    fill_in "Subcatogory", with: @phonee.subcatogory_id
    fill_in "Url", with: @phonee.url
    click_on "Create phonee"

    assert_text "phonee was successfully created"
    click_on "Back"
  end

  test "should update phonee" do
    visit phonee_url(@phonee)
    click_on "Edit this phonee", match: :first

    fill_in "Category", with: @phonee.category_id
    fill_in "Description", with: @phonee.description
    fill_in "Name", with: @phonee.name
    fill_in "Price", with: @phonee.price
    fill_in "Property", with: @phonee.property_id
    fill_in "Seller", with: @phonee.seller_id
    fill_in "Subcatogory", with: @phonee.subcatogory_id
    fill_in "Url", with: @phonee.url
    click_on "Update phonee"

    assert_text "phonee was successfully updated"
    click_on "Back"
  end

  test "should destroy phonee" do
    visit phonee_url(@phonee)
    click_on "Destroy this phonee", match: :first

    assert_text "phonee was successfully destroyed"
  end
end
