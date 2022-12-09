class FuelsController < ApplicationController
  def index
    matching_fuels = Fuel.all

    @list_of_fuels = matching_fuels.order({ :created_at => :desc })

    render({ :template => "fuels/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_fuels = Fuel.where({ :id => the_id })

    @the_fuel = matching_fuels.at(0)

    render({ :template => "fuels/show.html.erb" })
  end

  def create
    the_fuel = Fuel.new
    the_fuel.name = params.fetch("query_name")
    the_fuel.category = params.fetch("query_category")
    the_fuel.tanks_count = params.fetch("query_tanks_count")

    if the_fuel.valid?
      the_fuel.save
      redirect_to("/fuels", { :notice => "Fuel created successfully." })
    else
      redirect_to("/fuels", { :alert => the_fuel.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_fuel = Fuel.where({ :id => the_id }).at(0)

    the_fuel.name = params.fetch("query_name")
    the_fuel.category = params.fetch("query_category")
    the_fuel.tanks_count = params.fetch("query_tanks_count")

    if the_fuel.valid?
      the_fuel.save
      redirect_to("/fuels/#{the_fuel.id}", { :notice => "Fuel updated successfully."} )
    else
      redirect_to("/fuels/#{the_fuel.id}", { :alert => the_fuel.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_fuel = Fuel.where({ :id => the_id }).at(0)

    the_fuel.destroy

    redirect_to("/fuels", { :notice => "Fuel deleted successfully."} )
  end
end
