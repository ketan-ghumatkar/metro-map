class RailwayStationsController < ApplicationController

  def index
    @railway_stations = RailwayStation.all
  end

  def search

  end
end
