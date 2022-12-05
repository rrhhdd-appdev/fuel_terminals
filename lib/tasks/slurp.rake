namespace :slurp do
  desc "TODO"
  task product_terminals: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "petroleum_product_terminals.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    csv.each do |row|
      f = Facility.new
      f.name = row["NAME"]
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

      
      if row["Asphalt"] == "YES"
        a = Tank.new
        a.terminal_id = f.id
        a.fuel_id = 1


      end


      f.save
      puts "#{f.street_address}, #{f.zip} saved"
    end
    
    puts "There are now #{Transaction.count} rows in the transactions table"

  end

end
