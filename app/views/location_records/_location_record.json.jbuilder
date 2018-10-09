json.extract! location_record, :id, :location_type, :location_id, :start_date, :end_date, :latitude, :longitude, :address, :created_at, :updated_at
json.url location_record_url(location_record, format: :json)
