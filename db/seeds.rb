# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

require "open-uri"
require "json"


PARIS_API = "https://opendata.paris.fr/api/records/1.0/search/?dataset=paris-autrement-balades-dans-les-arrondissements-peripheriques-poi&q=&rows=157"


poi_json = URI.open(PARIS_API).read
poi_array = JSON.parse(poi_json)["records"]


poi_array.each do |poi|
  place = Place.new
  place.name = poi["fields"]["nom_poi"]
  address = poi["fields"]["adresse"].nil? ? " " : poi["fields"]["adresse"]
  city = poi["fields"]["ville"].nil? ? " " : poi["fields"]["ville"]
  postal_code = poi["fields"]["code_postal"].nil? ? " " : poi["fields"]["code_postal"]
  place.address = "#{address} , #{postal_code} #{city}"
  place.geo_lat = poi["fields"]["geo_point_2d"][0]
  place.geo_long = poi["fields"]["geo_point_2d"][1]
  place.description = poi["fields"]["texte_description"]
  nul_url = [nil, "https://capgeo.maps.arcgis.com/sharing/rest/content/items/7a34d77806a44be592fa49079c2ab97c/data"]
  place.url_image = poi["fields"]["url_image"] unless nul_url.include? poi["fields"]["url_image"]
  place.poi_id = poi["fields"]["identifiant"].partition("-").last.to_i
  place.save!
  parcours = poi["fields"]["parcours"].split(";")
  parcours.each do |p|
    trip = Trip.where(name: p).first_or_create
    place.trips << trip
  end
  category = Category.where(name: poi["fields"]["categorie"]).first_or_create
  place.categories << category
end

Trip.all.each do |trip|
  places_of_trip = trip.places.order(:poi_id)
  trip.geo_long_departure = places_of_trip.first.geo_long
  trip.geo_lat_departure = places_of_trip.first.geo_lat
  trip.geo_long_arrival = places_of_trip.last.geo_long
  trip.geo_lat_arrival = places_of_trip.last.geo_lat
  trip.departure = places_of_trip.first.name
  trip.arrival = places_of_trip.last.name
  coord = ""
  places_of_trip.each { |place| coord += "#{place.geo_long}%2C#{place.geo_lat}%3B" }
  coord = coord.chomp("%3B")
  route_api = "https://api.mapbox.com/directions/v5/mapbox/walking/#{coord}?alternatives=true&geometries=geojson&language=en&overview=simplified&steps=true&access_token=#{ENV['MAPBOX_API_KEY']}"
  route_json = URI.open(route_api).read
  route_resp = JSON.parse(route_json)
  trip.kms = (route_resp["routes"][0]["distance"]/1000).round(2)
  trip.duration = route_resp["routes"][0]["duration"]
  trip.save!
end

#route_api="https://api.mapbox.com/directions/v5/mapbox/walking/#{geo_long1}%2C#{geo_lat1}%3B#{geo_long2}%2C#{geo_lat2}%3B#{geo_long3}%2C#{geo_lat3}?alternatives=true&geometries=geojson&language=en&overview=simplified&steps=true&access_token=#{token}"
