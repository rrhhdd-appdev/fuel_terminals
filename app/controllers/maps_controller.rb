class MapsController < ApplicationController
  
  def index
    matching_facilities = Facility.all

    @list_of_facilities = matching_facilities.order({ :created_at => :desc })
    
    render({ :template => "maps/index.html.erb" })
  end
end
