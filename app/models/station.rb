class Station < ActiveRecord::Base
  has_and_belongs_to_many :connected_stations,
                          :class_name => "Station",
                          :join_table => "connected_stations",
                          :foreign_key => "station_id",
                          :association_foreign_key => "connected_station_id"
  
  attr_accessible :name

  def add_connected_stations(station)
    self.connected_stations << station unless self.connected_stations.include?(station) || station == self
  end
end
