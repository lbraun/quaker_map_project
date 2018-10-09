require 'test_helper'

class LocationRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_record = location_records(:one)
  end

  test "should get index" do
    get location_records_url
    assert_response :success
  end

  test "should get new" do
    get new_location_record_url
    assert_response :success
  end

  test "should create location_record" do
    assert_difference('LocationRecord.count') do
      post location_records_url, params: { location_record: { address: @location_record.address, end_date: @location_record.end_date, latitude: @location_record.latitude, location_id: @location_record.location_id, location_type: @location_record.location_type, longitude: @location_record.longitude, start_date: @location_record.start_date } }
    end

    assert_redirected_to location_record_url(LocationRecord.last)
  end

  test "should show location_record" do
    get location_record_url(@location_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_record_url(@location_record)
    assert_response :success
  end

  test "should update location_record" do
    patch location_record_url(@location_record), params: { location_record: { address: @location_record.address, end_date: @location_record.end_date, latitude: @location_record.latitude, location_id: @location_record.location_id, location_type: @location_record.location_type, longitude: @location_record.longitude, start_date: @location_record.start_date } }
    assert_redirected_to location_record_url(@location_record)
  end

  test "should destroy location_record" do
    assert_difference('LocationRecord.count', -1) do
      delete location_record_url(@location_record)
    end

    assert_redirected_to location_records_url
  end
end
