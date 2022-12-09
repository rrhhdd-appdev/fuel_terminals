class MapsController < ApplicationController
  
  def index
    matching_facilities = Facility.all

    @list_of_facilities = matching_facilities.order({ :created_at => :desc })


    # Returns an array of all states in which there are terminals

    @state_list = Array.new
    
    Facility.all.each do |findstate|
      current_state = findstate.state
      if @state_list.include? current_state
      else
        @state_list.push(current_state)
      end 
    end

    

    
    render({ :template => "maps/index.html.erb" })
  end
end
