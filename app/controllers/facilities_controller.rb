class FacilitiesController < ApplicationController
  def index
    @q = Facility.ransack(params[:q])
    @list_of_facilities = @q.result

    # matching_facilities = Facility.all
    # @list_of_facilities = matching_facilities.order({ :created_at => :desc })

    render({ :template => "facilities/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_facilities = Facility.where({ :id => the_id })

    @the_facility = matching_facilities.at(0)

    # To get the signed in user's terminal notes

    user_id = session.fetch(:user_id)
    matching_terminal_notes = TerminalNote.all.where(:user => user_id)

    @list_of_terminal_notes = matching_terminal_notes.order({ :created_at => :desc })

    # To get the available products

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
    the_facility.marine_out = params.fetch("query_marine_out", false)
    the_facility.rail_in = params.fetch("query_rail_in", false)
    the_facility.rail_out = params.fetch("query_rail_out", false)
    the_facility.parsel = params.fetch("query_parsel")
    the_facility.city = params.fetch("query_city")
    the_facility.state = params.fetch("query_state")
    the_facility.zip = params.fetch("query_zip")
    the_facility.zip4 = params.fetch("query_zip4")

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
    the_facility.marine_out = params.fetch("query_marine_out", false)
    the_facility.rail_in = params.fetch("query_rail_in", false)
    the_facility.rail_out = params.fetch("query_rail_out", false)
    the_facility.parsel = params.fetch("query_parsel")
    the_facility.city = params.fetch("query_city").upcase
    the_facility.state = params.fetch("query_state")
    the_facility.zip = params.fetch("query_zip")
    the_facility.zip4 = params.fetch("query_zip4")
    the_facility.asphalt = params.fetch("query_asphalt", false)
    the_facility.chemicals = params.fetch("query_chemicals", false)
    the_facility.propane = params.fetch("query_propane", false)
    the_facility.ethanol = params.fetch("query_ethanol", false)
    the_facility.refined = params.fetch("query_refined", false)
    the_facility.biodiesel = params.fetch("query_biodiesel", false)
    the_facility.crude_oil = params.fetch("query_crude_oil", false)
    the_facility.jetfuel = params.fetch("query_jetfuel", false)
    the_facility.gasoline = params.fetch("query_gasoline", false)
    the_facility.distillate = params.fetch("query_distillate", false)
    the_facility.avgas = params.fetch("query_avgas", false)
    the_facility.butane = params.fetch("query_butane", false)
    the_facility.renewable_diesel = params.fetch("query_renewable_diesel", false)

    if the_facility.valid?
      the_facility.save
      redirect_to("/facilities/#{the_facility.id}", { :notice => "Facility updated successfully." })
    else
      redirect_to("/facilities/#{the_facility.id}", { :alert => the_facility.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_facility = Facility.where({ :id => the_id }).at(0)

    the_facility.destroy

    redirect_to("/facilities", { :notice => "Facility deleted successfully." })
  end

  def quickupdate
    the_id = params.fetch("path_id")
    the_facility = Facility.where({ :id => the_id }).at(0)

    the_facility.name = params.fetch("query_name")
    the_facility.city = params.fetch("query_city")
    the_facility.website = params.fetch("query_website")
    the_facility.owner = params.fetch("query_owner")
    the_facility.operator = params.fetch("query_operator")
    the_facility.capacity = params.fetch("query_capacity")

    the_facility.truck_in = params.fetch("query_truck_in")
    the_facility.truck_out = params.fetch("query_truck_out")
    the_facility.pipe_in = params.fetch("query_pipe_in")
    the_facility.pipe_out = params.fetch("query_pipe_out")
    the_facility.marine_in = params.fetch("query_marine_in")
    the_facility.marine_out = params.fetch("query_marine_out")
    the_facility.rail_in = params.fetch("query_rail_in")
    the_facility.rail_out = params.fetch("query_rail_out")

    the_facility.asphalt = params.fetch("query_asphalt", false)
    the_facility.chemicals = params.fetch("query_chemicals", false)
    the_facility.propane = params.fetch("query_propane", false)
    the_facility.ethanol = params.fetch("query_ethanol", false)
    the_facility.refined = params.fetch("query_refined", false)
    the_facility.biodiesel = params.fetch("query_biodiesel", false)
    the_facility.crude_oil = params.fetch("query_crude_oil", false)
    the_facility.jetfuel = params.fetch("query_jetfuel", false)
    the_facility.gasoline = params.fetch("query_gasoline", false)
    the_facility.distillate = params.fetch("query_distillate", false)
    the_facility.avgas = params.fetch("query_avgas", false)
    the_facility.butane = params.fetch("query_butane", false)

    if the_facility.valid?
      the_facility.save
      redirect_to("/facilities/#{the_facility.id}", { :notice => "Facility updated successfully." })
    else
      redirect_to("/facilities/#{the_facility.id}", { :alert => the_facility.errors.full_messages.to_sentence })
    end
  end
end
