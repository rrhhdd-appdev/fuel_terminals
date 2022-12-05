class MapsController < ApplicationController
  
  def index
    render({ :template => "maps/index.html.erb" })
  end
end
