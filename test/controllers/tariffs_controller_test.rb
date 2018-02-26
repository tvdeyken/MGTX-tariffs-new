require 'test_helper'

class TariffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tariff = tariffs(:one)
  end

  test "should get index" do
    get tariffs_url
    assert_response :success
  end

  test "should get new" do
    get new_tariff_url
    assert_response :success
  end

  test "should create tariff" do
    assert_difference('Tariff.count') do
      post tariffs_url, params: { tariff: { carrier: @tariff.carrier, country: @tariff.country, expire: @tariff.expire, loading_region: @tariff.loading_region, price: @tariff.price, transit_time: @tariff.transit_time, weight: @tariff.weight, zip: @tariff.zip } }
    end

    assert_redirected_to tariff_url(Tariff.last)
  end

  test "should show tariff" do
    get tariff_url(@tariff)
    assert_response :success
  end

  test "should get edit" do
    get edit_tariff_url(@tariff)
    assert_response :success
  end

  test "should update tariff" do
    patch tariff_url(@tariff), params: { tariff: { carrier: @tariff.carrier, country: @tariff.country, expire: @tariff.expire, loading_region: @tariff.loading_region, price: @tariff.price, transit_time: @tariff.transit_time, weight: @tariff.weight, zip: @tariff.zip } }
    assert_redirected_to tariff_url(@tariff)
  end

  test "should destroy tariff" do
    assert_difference('Tariff.count', -1) do
      delete tariff_url(@tariff)
    end

    assert_redirected_to tariffs_url
  end
end
