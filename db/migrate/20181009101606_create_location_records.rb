class CreateLocationRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :location_records do |t|
      t.string :location_type
      t.integer :location_id
      t.date :start_date
      t.date :end_date
      t.decimal :latitude
      t.decimal :longitude
      t.text :address

      t.timestamps
    end
  end
end
