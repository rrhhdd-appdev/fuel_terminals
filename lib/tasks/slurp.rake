namespace :slurp do
  desc "TODO"
  task product_terminals: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "petroleum_product_terminals.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    # Add in new terminals
    csv.each do |row|
      f = Facility.new
      f.name = row["NAME"]
      f.term_id = row["TERM_ID"]
      f.address = row["ADDRESS"]
      f.city = row["CITY"]
      f.state = row["STATE"]
      f.zip = row["ZIP"]
      f.zip4 = row["ZIP4"]
      f.phone = row["TELEPHONE"]
      f.latitude = row["LATITUDE"]
      f.longitude = row["LONGITUDE"]
      f.county = row["COUNTY"]
      f.countyfips = row["COUNTYFIPS"]
      f.commodity = row["COMMODITY"]
      f.capacity = row["CAPACITY"]
      f.marine_out = row["MARINE_OUT"]
      f.marine_in = row["MARINE-IN"]
      f.operator = row["OPERATOR"]
      f.owner = row["OWNER"]
      f.parsel = row["POSREL"]
      f.pipe_in = row["PIPE_IN"]
      f.pipe_out = row["PIPE_OUT"]
      f.rail_in = row["RAIL_IN"]
      f.rail_out = row["RAIL_OUT"]
      f.source = row["SOURCE"]
      f.term_type = row["TYPE"]
      f.truck_in = row["TRUCK_IN"]
      f.truck_out = row["TRUCK_OUT"]
      f.website = row["WEBSITE"]
      f.status = row["STATUS"]
      
      f.save
      
      puts "#{f.term_id} saved"

      # Add product/terminal pairs into the "tanks" table

      if row["ASPHALT"] == "YES"
        a = Tank.new
        a.terminal_id = f.id
        a.fuel_id = 1
        a.save
      end

      if row["CHEMICALS"] == "YES"
        a = Tank.new
        a.terminal_id = f.id
        a.fuel_id = 2
        a.save
      end
      if row["PROPANE"] == "YES"
        a = Tank.new
        a.terminal_id = f.id
        a.fuel_id = 3
        a.save
      end
      if row["REFINED"] == "YES"
        a = Tank.new
        a.terminal_id = f.id
        a.fuel_id = 5
        a.save
      end
      if row["ETHANOL"] == "YES"
        a = Tank.new
        a.terminal_id = f.id
        a.fuel_id = 6
        a.save
      end
      if row["BIODIESEL"] == "YES"
        a = Tank.new
        a.terminal_id = f.id
        a.fuel_id = 7
        a.save
      end
      if row["CRUDE_OIL"] == "YES"
        a = Tank.new
        a.terminal_id = f.id
        a.fuel_id = 8
        a.save
      end
      if row["JETFUEL"] == "YES"
        a = Tank.new
        a.terminal_id = f.id
        a.fuel_id = 9
        a.save
      end
      if row["GASOLINE"] == "YES"
        a = Tank.new
        a.terminal_id = f.id
        a.fuel_id = 10
        a.save
      end
      if row["DISTILLATE"] == "YES"
        a = Tank.new
        a.terminal_id = f.id
        a.fuel_id = 11
        a.save
      end
      if row["AVGAS"] == "YES"
        a = Tank.new
        a.terminal_id = f.id
        a.fuel_id = 12
        a.save
      end
      if row["BUTANE"] == "YES"
        a = Tank.new
        a.terminal_id = f.id
        a.fuel_id = 4
        a.save
      end

    end
    
    puts "There are now #{Facility.count} rows in the Facilities table"
    puts "There are now #{Tank.count} rows in the Tanks table"

  end

end
