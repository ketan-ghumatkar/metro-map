def check_mysql_connection
  ActiveRecord::Base.connection.reconnect! unless ActiveRecord::Base.connection.active?
end

namespace :populate_railway_station do

  task :init => :environment do
    check_mysql_connection
  end

  desc "Populate all railway stations data"
  task :populate => :init do
    puts "---------- Initializing Stations Data -------------"
    
    File.open("#{Rails.root}/public/metro.txt").each_line do |line|
    
      station_names = line.split(/\:|,/)

      mstation = Station.find_or_create_by_name(name: station_names.first.strip)
      station_names.shift
      puts "** Main Station :: " + mstation.name

      station_names.each do |sname|
        cstation = Station.find_or_create_by_name(sname.strip)
        mstation.add_connected_stations cstation
        puts "* Conneted Station :-: " + cstation.name
      end
    
      puts "\n"
    end

    puts "----------- Populated Stations Data --------------"
  end
end
