require "application_system_test_case"

class LocationRecordsTest < ApplicationSystemTestCase
  setup do
    @location_record = location_records(:one)
  end

  test "visiting the index" do
    visit location_records_url
    assert_selector "h1", text: "Location Records"
  end

  test "creating a Location record" do
    visit location_records_url
    click_on "New Location Record"

    fill_in "Address", with: @location_record.address
    fill_in "End Date", with: @location_record.end_date
    fill_in "Latitude", with: @location_record.latitude
    fill_in "Location", with: @location_record.location_id
    fill_in "Location Type", with: @location_record.location_type
    fill_in "Longitude", with: @location_record.longitude
    fill_in "Start Date", with: @location_record.start_date
    click_on "Create Location record"

    assert_text "Location record was successfully created"
    click_on "Back"
  end

  test "updating a Location record" do
    visit location_records_url
    click_on "Edit", match: :first

    fill_in "Address", with: @location_record.address
    fill_in "End Date", with: @location_record.end_date
    fill_in "Latitude", with: @location_record.latitude
    fill_in "Location", with: @location_record.location_id
    fill_in "Location Type", with: @location_record.location_type
    fill_in "Longitude", with: @location_record.longitude
    fill_in "Start Date", with: @location_record.start_date
    click_on "Update Location record"

    assert_text "Location record was successfully updated"
    click_on "Back"
  end

  test "destroying a Location record" do
    visit location_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Location record was successfully destroyed"
  end
end
