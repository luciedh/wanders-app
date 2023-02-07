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
  place.poi_id = poi["fields"]["identifiant"]
  place.save!
  parcours = poi["fields"]["parcours"].split(";")
  parcours.each do |p|
    trip = Trip.where(name: p).first_or_create
    place.trips << trip
  end
  category = Category.where(name: poi["fields"]["categorie"]).first_or_create
  place.categories << category
end

matrix = GoogleDistanceMatrix::Matrix.new
