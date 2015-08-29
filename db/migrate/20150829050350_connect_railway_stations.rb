class ConnectRailwayStations < ActiveRecord::Migration
  def change
    create_table :connected_stations, id: false do |t|
      t.integer :station_id
      t.integer :connected_station_id
    end
  
    add_index(:connected_stations, [:station_id, :connected_station_id], :unique => true)
    add_index(:connected_stations, [:connected_station_id, :station_id], :unique => true)
  end
end
