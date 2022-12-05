class FacilitiesController < ApplicationController
  def index
    matching_facilities = Facility.all

    @list_of_facilities = matching_facilities.order({ :created_at => :desc })

    render({ :template => "facilities/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_facilities = Facility.where({ :id => the_id })

    @the_facility = matching_facilities.at(0)

    render({ :template => "facilities/show.html.erb" })
  end

  def create
    the_facility = Facility.new
    the_facility.name = params.fetch("query_name")
    the_facility.address = params.fetch("query_address")
    the_facility.phone = params.fetch("query_phone")
    the_facility.term_type = params.fetch("query_term_type")
    the_facility.status = params.fetch("query_status", false)
    the_facility.county = params.fetch("query_county")
    the_facility.latitude = params.fetch("query_latitude")
    the_facility.longitude = params.fetch("query_longitude")
    the_facility.source = params.fetch("query_source")
    the_facility.website = params.fetch("query_website")
    the_facility.owner = params.fetch("query_owner")
    the_facility.operator = params.fetch("query_operator")
    the_facility.commodity = params.fetch("query_commodity")
    the_facility.capacity = params.fetch("query_capacity")
    the_facility.truck_in = params.fetch("query_truck_in", false)
    the_facility.truck_out = params.fetch("query_truck_out", false)
    the_facility.pipe_in = params.fetch("query_pipe_in", false)
    the_facility.pipe_out = params.fetch("query_pipe_out", false)
    the_facility.marine_in = params.fetch("query_marine_in", false)
    the_facility.marin_out = params.fetch("query_marin_out", false)
    the_facility.rail_in = params.fetch("query_rail_in", false)
    the_facility.rail_out = params.fetch("query_rail_out", false)
    the_facility.parsel = params.fetch("query_parsel")
    the_facility.city = params.fetch("query_city")
    the_facility.state = params.fetch("query_state")
    the_facility.zip = params.fetch("query_zip")
    the_facility.zip4 = params.fetch("query_zip4")
    the_facility.tanks_count = params.fetch("query_tanks_count")

    if the_facility.valid?
      the_facility.save
      redirect_to("/facilities", { :notice => "Facility created successfully." })
    else
      redirect_to("/facilities", { :alert => the_facility.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_facility = Facility.where({ :id => the_id }).at(0)

    the_facility.name = params.fetch("query_name")
    the_facility.address = params.fetch("query_address")
    the_facility.phone = params.fetch("query_phone")
    the_facility.term_type = params.fetch("query_term_type")
    the_facility.status = params.fetch("query_status", false)
    the_facility.county = params.fetch("query_county")
    the_facility.latitude = params.fetch("query_latitude")
    the_facility.longitude = params.fetch("query_longitude")
    the_facility.source = params.fetch("query_source")
    the_facility.website = params.fetch("query_website")
    the_facility.owner = params.fetch("query_owner")
    the_facility.operator = params.fetch("query_operator")
    the_facility.commodity = params.fetch("query_commodity")
    the_facility.capacity = params.fetch("query_capacity")
    the_facility.truck_in = params.fetch("query_truck_in", false)
    the_facility.truck_out = params.fetch("query_truck_out", false)
    the_facility.pipe_in = params.fetch("query_pipe_in", false)
    the_facility.pipe_out = params.fetch("query_pipe_out", false)
    the_facility.marine_in = params.fetch("query_marine_in", false)
    the_facility.marin_out = params.fetch("query_marin_out", false)
    the_facility.rail_in = params.fetch("query_rail_in", false)
    the_facility.rail_out = params.fetch("query_rail_out", false)
    the_facility.parsel = params.fetch("query_parsel")
    the_facility.city = params.fetch("query_city")
    the_facility.state = params.fetch("query_state")
    the_facility.zip = params.fetch("query_zip")
    the_facility.zip4 = params.fetch("query_zip4")
    the_facility.tanks_count = params.fetch("query_tanks_count")

    if the_facility.valid?
      the_facility.save
      redirect_to("/facilities/#{the_facility.id}", { :notice => "Facility updated successfully."} )
    else
      redirect_to("/facilities/#{the_facility.id}", { :alert => the_facility.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_facility = Facility.where({ :id => the_id }).at(0)

    the_facility.destroy

    redirect_to("/facilities", { :notice => "Facility deleted successfully."} )
  end
end
