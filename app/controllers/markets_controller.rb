class MarketsController < ApplicationController
  
  def index
    # matching_fuels = Fuel.all
    # @list_of_fuels = matching_fuels.order({ :created_at => :desc })

    render({ :template => "markets/index.html.erb" })
  end
 
  def show
    the_state = params.fetch("path_id")

    @matching_facilities = Facility.where({ :state => the_state })

    @capacity_sum = 0
    @matching_facilities.each do |add_cap|
      @capacity_sum += add_cap.capacity 
    end


    render({ :template => "markets/show.html.erb" })
  end

end
