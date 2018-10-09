class LocationRecord < ApplicationRecord
  def to_s
    "#{location_type} #{location_id}"
  end

  def self.welcome_map_data
    all.map do |location_record|
      {
        id: location_record.id,
        name: location_record.to_s,
        x: location_record.longitude,
        y: location_record.latitude
      }
    end
  end
end
