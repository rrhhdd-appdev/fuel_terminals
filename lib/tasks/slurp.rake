namespace :slurp do
  desc "TODO"
  task product_terminals: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "fuel_terminals.csv"))
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
      f.marine_in = row["MARINE_IN"]
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
      f.naics_code = row["NAICS_CODE"]
      f.naics_desc = row["NAICS_DESC"]
      f.exstars_i = row["EXSTARS_I"]

      if row["ASPHALT"] == "YES"
        f.asphalt = true
      else
        f.asphalt = false
      end

      if row["CHEMICALS"] == "YES"
        f.chemicals = true
      else
        f.chemicals = false
      end

      if row["PROPANE"] == "YES"
        f.propane = true
      else
        f.propane = false
      end

      if row["REFINED"] == "YES"
        f.refined = true
      else
        f.refined = false
      end

      if row["ETHANOL"] == "YES"
        f.ethanol = true
      else
        f.ethanol = false
      end

      if row["BIODIESEL"] == "YES"
        f.biodiesel = true
      else
        f.biodiesel = false
      end

      if row["CRUDE_OIL"] == "YES"
        f.crude_oil = true
      else
        f.crude_oil = false
      end

      if row["JETFUEL"] == "YES"
        f.jetfuel = true
      else
        f.jetfuel = false
      end

      if row["GASOLINE"] == "YES"
        f.gasoline = true
      else
        f.gasoline = false
      end

      if row["DISTILLATE"] == "YES"
        f.distillate = true
      else
        f.distillate = false
      end

      if row["AVGAS"] == "YES"
        f.avgas = true
      else
        f.avgas = false
      end

      if row["BUTANE"] == "YES"
        f.butane = true
      else
        f.butane = false
      end

      if row["RENEWABLE_DIESEL"] == "YES"
        f.renewable_diesel = true
      else
        f.renewable_diesel = false
      end

      f.save
      puts "#{f.term_id} saved"
    end

    puts "There are now #{Facility.count} rows in the Facilities table"
  end
end
