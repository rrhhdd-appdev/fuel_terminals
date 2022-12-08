class MarketsController < ApplicationController
  

  def index


    @the_city = params.fetch("city").upcase
    @the_state = params.fetch("state")
    @the_zip = params.fetch("zip")

    
    query_filters = Hash.new

      if @the_city != ""
        query_filters.store(:city, @the_city)
      end
      if @the_state != "State"
        query_filters.store(:state, @the_state)
      end
      if @the_zip != ""
        query_filters.store(:zip, @the_zip)
      end

    @matching_facilities = Facility.where(query_filters)
    

    
    @state_list = Array.new
    
    Facility.all.each do |findstate|
      current_state = findstate.state
      if @state_list.include? current_state
      else
        @state_list.push(current_state)
      end 
    end
    
      
    
    
    # @matching_facilities = Facility.where({ :city => @the_city, :state => @the_state, :zip => @the_zip })






    @capacity_sum = 0
    @matching_facilities.each do |add_cap|
      @capacity_sum += add_cap.capacity 
    end

    render({ :template => "markets/index.html.erb" })


        # matching_fuels = Fuel.all
    # @list_of_fuels = matching_fuels.order({ :created_at => :desc })

    # if @the_city.empty?
    #   if @the_state.empty?
    #     if @the_zip.empty?
    #       @matching_facilities = Facility.all
    #     else 
    #       @matching_facilities = Facility.where({ :zip => @the_zip})
    #     end
    #   else
      
    #   end
    # end

       # if @the_city != nil
    #   # if @the_state !=nil 
    # @matching_facilities = Facility.where({ :city => @the_city, :state => @the_state, :zip => @the_zip })
    # else
      
    # else
    #   @matching_facilities = Facility.where({ :city => @the_city})
    # end

    # @matching_facilities = Facility.where({ :city => @the_city })



    # if @the_state != nil
    #   @matching_facilities = Facility.where({ :state => @the_state })
    # end


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

  def search
    @search_state = params.fetch("query_state")

    redirect_to("/markets/#{@search_state}", { :notice => "State successfully searched."} )

  end

end
