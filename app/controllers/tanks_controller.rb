class TanksController < ApplicationController
  def index
    matching_tanks = Tank.all

    @list_of_tanks = matching_tanks.order({ :created_at => :desc })

    render({ :template => "tanks/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_tanks = Tank.where({ :id => the_id })

    @the_tank = matching_tanks.at(0)

    render({ :template => "tanks/show.html.erb" })
  end

  def create
    the_tank = Tank.new
    the_tank.terminal_id = params.fetch("query_terminal_id")
    the_tank.fuel_id = params.fetch("query_fuel_id")
    the_tank.product_capacity = params.fetch("query_product_capacity")

    if the_tank.valid?
      the_tank.save
      redirect_to("/facilities/#{the_tank.terminal_id}", { :notice => "Tank created successfully." })
    else
      redirect_to("/facilities/#{the_tank.terminal_id}", { :alert => the_tank.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_tank = Tank.where({ :id => the_id }).at(0)

    the_tank.terminal_id = params.fetch("query_terminal_id")
    the_tank.fuel_id = params.fetch("query_fuel_id")
    the_tank.product_capacity = params.fetch("query_product_capacity")

    if the_tank.valid?
      the_tank.save
      redirect_to("/tanks/#{the_tank.id}", { :notice => "Tank updated successfully."} )
    else
      redirect_to("/tanks/#{the_tank.id}", { :alert => the_tank.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_tank = Tank.where({ :id => the_id }).at(0)
    the_facility = the_tank.terminal_id

    the_tank.destroy

    redirect_to("/facilities/#{the_facility}", { :notice => "Tank deleted successfully."} )
  end
end
