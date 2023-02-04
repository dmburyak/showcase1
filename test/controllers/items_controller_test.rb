require "test_helper"

class phonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phone = phones(:one)
  end

  test "should get index" do
    get phones_url
    assert_response :success
  end

  test "should get new" do
    get new_phone_url
    assert_response :success
  end

  test "should create phone" do
    assert_difference("phone.count") do
      post phones_url, params: { phone: { category_id: @phone.category_id, description: @phone.description, name: @phone.name, price: @phone.price, property_id: @phone.property_id, seller_id: @phone.seller_id, subcatogory_id: @phone.subcatogory_id, url: @phone.url } }
    end

    assert_redirected_to phone_url(Phone.last)
  end

  test "should show phone" do
    get phone_url(@phone)
    assert_response :success
  end

  test "should get edit" do
    get edit_phone_url(@phone)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@phone), params: { phone: { category_id: @phone.category_id, description: @phone.description, name: @phone.name, price: @phone.price, property_id: @phone.property_id, seller_id: @phone.seller_id, subcatogory_id: @phone.subcatogory_id, url: @phone.url } }
    assert_redirected_to item_url(@phone)
  end

  test "should destroy item" do
    assert_difference("Item.count", -1) do
      delete item_url(@phone)
    end

    assert_redirected_to items_url
  end
end
