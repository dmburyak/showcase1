require "test_helper"

class phoneesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phonee = phonees(:one)
  end

  test "should get index" do
    get phonees_url
    assert_response :success
  end

  test "should get new" do
    get new_phonee_url
    assert_response :success
  end

  test "should create phonee" do
    assert_difference("phonee.count") do
      post phonees_url, params: { phonee: { category_id: @phonee.category_id, description: @phonee.description, name: @phonee.name, price: @phonee.price, property_id: @iteme.property_id, seller_id: @iteme.seller_id, subcatogory_id: @iteme.subcatogory_id, url: @iteme.url } }
    end

    assert_redirected_to iteme_url(Iteme.last)
  end

  test "should show iteme" do
    get iteme_url(@iteme)
    assert_response :success
  end

  test "should get edit" do
    get edit_iteme_url(@iteme)
    assert_response :success
  end

  test "should update iteme" do
    patch iteme_url(@iteme), params: { iteme: { category_id: @iteme.category_id, description: @iteme.description, name: @iteme.name, price: @iteme.price, property_id: @iteme.property_id, seller_id: @iteme.seller_id, subcatogory_id: @iteme.subcatogory_id, url: @iteme.url } }
    assert_redirected_to iteme_url(@iteme)
  end

  test "should destroy iteme" do
    assert_difference("Iteme.count", -1) do
      delete iteme_url(@iteme)
    end

    assert_redirected_to itemes_url
  end
end
