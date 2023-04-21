class Maps2Controller < ApplicationController
  def index
    @facilities = Facility.all
    @markers = @facilities.map { |facility| { latitude: facility.latitude, longitude: facility.longitude, name: facility.name } }
    @states = Facility.pluck(:state).uniq.sort

    render({ :template => "maps2/index.html.erb" })
  end

  def search
    facilities = Facility.all
    facilities = facilities.where("name LIKE ?", "%#{params[:name]}%") if params[:name].present?
    facilities = facilities.where(state: params[:state]) if params[:state].present?
    markers = facilities.map do |f|
      {
        id: f.id,
        latitude: f.latitude,
        longitude: f.longitude,
        name: f.name,
      }
    end
    render json: { markers: markers }
  end
end
