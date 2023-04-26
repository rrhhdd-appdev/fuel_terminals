class Maps2Controller < ApplicationController
  def index
    @facilities = Facility.all
    @markers = @facilities.map { |facility| { id: facility.id, latitude: facility.latitude, longitude: facility.longitude, name: facility.name } }
    @states = Facility.pluck(:state).uniq.sort

    render({ :template => "maps2/index.html.erb" })
  end

  def search
    facilities = Facility.all
    facilities = facilities.where("name LIKE ?", "%#{params[:name]}%") if params[:name].present?
    facilities = facilities.where(state: params[:state]) if params[:state].present?
    facilities = facilities.where(city: params[:city].upcase) if params[:city].present?
    facilities = facilities.where(zip: params[:zip]) if params[:zip].present?

    if params[:products].present?
      params[:products].each do |product|
        facilities = facilities.where("#{product} = ?", true)
      end
    end

    markers = facilities.map do |f|
      {
        id: f.id,
        latitude: f.latitude,
        longitude: f.longitude,
        name: f.name,
        address: f.address,
        capacity: f.capacity,
        city: f.city,
        state: f.state,
      }
    end
    total_capacity = facilities.sum(:capacity)
    render json: { markers: markers, count: facilities.count, total_capacity: total_capacity }
  end
end
