require "test_helper"

class PropertyGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property_group = property_groups(:one)
  end

  test "should get index" do
    get property_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_property_group_url
    assert_response :success
  end

  test "should create property_group" do
    assert_difference("PropertyGroup.count") do
      post property_groups_url, params: { property_group: { name: @property_group.name } }
    end

    assert_redirected_to property_group_url(PropertyGroup.last)
  end

  test "should show property_group" do
    get property_group_url(@property_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_property_group_url(@property_group)
    assert_response :success
  end

  test "should update property_group" do
    patch property_group_url(@property_group), params: { property_group: { name: @property_group.name } }
    assert_redirected_to property_group_url(@property_group)
  end

  test "should destroy property_group" do
    assert_difference("PropertyGroup.count", -1) do
      delete property_group_url(@property_group)
    end

    assert_redirected_to property_groups_url
  end
end
