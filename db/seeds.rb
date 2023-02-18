
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
  # place.url_image = poi["fields"]["url_image"] unless nul_url.include? poi["fields"]["url_image"]
  if nul_url.include? poi["fields"]["url_image"]
    place.url_image = "https://source.unsplash.com/random/?building"
  else
    place.url_image = poi["fields"]["url_image"]
  end
  place.poi_id = poi["fields"]["identifiant"].partition("-").last.to_i
  place.average_rating = rand(1..5)
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

# route_api="https://api.mapbox.com/directions/v5/mapbox/walking/#{geo_long1}%2C#{geo_lat1}%3B#{geo_long2}%2C#{geo_lat2}%3B#{geo_long3}%2C#{geo_lat3}?alternatives=true&geometries=geojson&language=en&overview=simplified&steps=true&access_token=#{token}"


Place.find(1).update(url_image: "https://cdn.shopify.com/s/files/1/0187/8080/files/dragon-rue-du-moulin-vert-paris-14.png?v=1558100829")
Place.find(2).update(url_image: "https://cdn.shopify.com/s/files/1/0187/8080/files/Montpar-8.jpg?v=1558694317")
Place.find(4).update(url_image: "https://pariscosmop.fr/wp-content/uploads/2022/05/quartier-Maison-du-Bresil-paris.jpg")
Place.find(6).update(url_image: "https://www.editionsalternatives.com/images/1658.jpg")
Place.find(7).update(url_image: "https://fr.wikipedia.org/wiki/Square_Ren%C3%A9-Le_Gall#/media/Fichier:Rose_LeGall.jpg")
Place.find(8).update(url_image: "https://passagedutemps.files.wordpress.com/2019/04/155-bd-vincent-auriol.-dfacedsc05772.jpg?w=768")
Place.find(9).update(url_image: "https://upload.wikimedia.org/wikipedia/commons/e/e4/240-242_boulevard_Raspail%2C_Paris_14e.jpg")
Place.find(10).update(url_image: "https://2.bp.blogspot.com/-jnCfzy4CZhs/U714eqX-BuI/AAAAAAAAS8U/6AQNflQDqVY/s1600/square+montsouris+paris+14+1.JPG")
Place.find(11).update(url_image: "https://3.bp.blogspot.com/-YvNYcFMzRJc/U72AzeB6C_I/AAAAAAAAS-I/fm8KPLhj6Ig/s1600/square+montsouris+paris+14+7.JPG")
Place.find(11).update(url_image: "https://3.bp.blogspot.com/-YvNYcFMzRJc/U72AzeB6C_I/AAAAAAAAS-I/fm8KPLhj6Ig/s1600/square+montsouris+paris+14+7.JPG")
Place.find(12).update(url_image: "https://www.pagesjaunes.fr/media/ugc/ecole_nationale_superieure_d_architecture_paris_val_de_seine_07505600_150734610?w=550&h=309")
Place.find(15).update(url_image: "https://cdn.paris.fr/eqpts-prod/2022/05/10/c86f275fe3cbbad539cf060e21ee65d4.jpg")
Place.find(16).update(url_image: "http://lamaisonducerfvolant.free.fr/images/FacadeMCV.jpg")
Place.find(17).update(url_image: "https://media.abcsalles.com/images/1/salles/900h/790572/ep7-guinguette-numerique-3.jpg")
Place.find(19).update(url_image: "https://paris-promeneurs.com/wp-content/uploads/2022/06/ateliers-campagne3-H700.jpg")
Place.find(20).update(url_image: "http://www.fondationlecorbusier.fr/corbucache/410x480_2049_459.jpg?r=0")
Place.find(21).update(url_image: "https://images.squarespace-cdn.com/content/v1/6048a0479c665367d3745fa4/1615478726499-DK9A3TY0Q9GNQZ5R1W99/Capture%2Bd%25E2%2580%2599%25C3%25A9cran%2B2021-03-10%2B%25C3%25A0%2B12.09.29.jpg?format=750w")
Place.find(22).update(url_image: "https://lh3.googleusercontent.com/p/AF1QipM8LvIXgWoCJlVSM8re_Aq3s3BUwDEJbQPX6clj=s1360-w1360-h1020")
Place.find(23).update(url_image: "https://lh3.googleusercontent.com/p/AF1QipPO4d-J70aLHcE5e3_hPjV6kbnse2qbufjsbncf=s1360-w1360-h1020")
Place.find(24).update(url_image: "https://www.pariszigzag.fr/wp-content/uploads/2017/02/Le_Viaduc_des_Arts-%C2%A9_Nicolas_Scordia-MG_5130-e1487610121985.jpg")

Place.find(47).update(url_image: "http://www.regieparis14.org/wp-content/uploads/2018/06/IMG_37661.jpg")
Place.find(48).update(url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/H%C3%B4pital_Saint-Vincent-de-Paul_%C3%A0_Paris_le_12_mars_2017_-_008.jpg/1280px-H%C3%B4pital_Saint-Vincent-de-Paul_%C3%A0_Paris_le_12_mars_2017_-_008.jpg")
Place.find(73).update(url_image: "https://www.pagesjaunes.fr/media/ugc/un_jour_d_atelier_07505600_114144427?w=1500&h=800&crop=false")
Place.find(87).update(url_image: "https://www.mpaa.fr/sites/default/files/styles/cover/public/upload/images/Broussais%20OK%201-HR.jpg?h=b872c474&itok=u8iVR-P9")
Place.find(96).update(url_image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/58/dd/60/caption.jpg?w=1200&h=-1&s=1")

User.create(
  # first_name: 'admin',
  # last_name: 'admin',
  # username: 'admin',
  email: 'admin@admin.com',
  password: 'adminadmin'
)
