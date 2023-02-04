require "application_system_test_case"

class phonesTest < ApplicationSystemTestCase
  setup do
    @phone = phones(:one)
  end

  test "visiting the index" do
    visit phones_url
    assert_selector "h1", text: "phones"
  end

  test "should create phone" do
    visit phones_url
    click_on "New phone"

    fill_in "Category", with: @phone.category_id
    fill_in "Description", with: @phone.description
    fill_in "Name", with: @phone.name
    fill_in "Price", with: @phone.price
    fill_in "Property", with: @phone.property_id
    fill_in "Seller", with: @phone.seller_id
    fill_in "Subcatogory", with: @phone.subcatogory_id
    fill_in "Url", with: @phone.url
    click_on "Create phone"

    assert_text "phone was successfully created"
    click_on "Back"
  end

  test "should update phone" do
    visit phone_url(@phone)
    click_on "Edit this phone", match: :first

    fill_in "Category", with: @phone.category_id
    fill_in "Description", with: @phone.description
    fill_in "Name", with: @phone.name
    fill_in "Price", with: @phone.price
    fill_in "Property", with: @phone.property_id
    fill_in "Seller", with: @phone.seller_id
    fill_in "Subcatogory", with: @phone.subcatogory_id
    fill_in "Url", with: @phone.url
    click_on "Update phone"

    assert_text "phone was successfully updated"
    click_on "Back"
  end

  test "should destroy phone" do
    visit phone_url(@phone)
    click_on "Destroy this phone", match: :first

    assert_text "phone was successfully destroyed"
  end
end
