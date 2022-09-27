require "geokit"

class GetsDistance
  def get(lat1, lng1, lat2, lng2)
    return if [lat1, lng1, lat2, lng2].any?(&:nil?)

    current_location = Geokit::LatLng.new(lat1, lng1)
    current_location.distance_to("#{lat2},#{lng2}")
  end
end
