
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

puts "creating places"
Place.create(address: "13-15 Rue de la Croix Faubin, 75011 Paris", geo_lat: 48.8588989954928, geo_long: 2.3853346295266062, name: "La machine du bon docteur Guillotin", description: "A l'angle des rues de la Croix Faubin et de la Roquette, vous remarquerez sur le sol 5 dalles rectangulaires en granit, encastrées dans le sol. Elles servaient de points d'appui aux montants de l'échafaud, la guillotine, qui était installée devant la prison de la Grande Roquette, dont il ne subsiste plus rien. En 1871, le directeur de la prison de la Roquette avait offert a contrecoeur (car il avait été surpris en train de les desceller pour son compte personnelles) cinq pierres au Musée Carnavalet, qui les refusa. Elles furent donc replacées à quelques mètres de  leur emplacement primitif dans une forme de croix de St André, non pas en forme de vraie croix chrétienne comme auparavant.
Mais il exista d'autres lieux pour les exécutions capitales: de 1792 à 1832, place de Grève (actuelle place de l'Hôtel de Ville), de 1832 à 1851, sur l'actuelle place St Jacques, à partir de 1899, devant puis dans la prison de la Santé.", url_image: "https://tse2.mm.bing.net/th?id=OIP.8yZ5qjMJGUAeplr374kimwHaDx&pid=Api&P=0")
Place.create(address: "Place de la nation, 75011, Paris", geo_lat: 48.8486157470653, geo_long: 2.395792536220951, name: "Une place à l'histoire bien occultée", description: "La Place de la Nation, célèbre étape des manifestations parisiennes, est un symbole républicain très présent, encore de nos jours. Elle ne prit son nom actuel qu'en 1880, pour la fête nationale. Sait-on cependant qu'elle fut le théâtre d'événements dramatiques, aujourd'hui opportunément occultés ? Autrefois appelée Place du Trône, elle prit tout naturellement le nom de Place du Trône Renversé lors de la Révolution. Et c'est là que furent sommairement exécutés à cette époque des centaines de victimes innocentes: femmes, enfants, vieillards... On en conserve le souvenir avec l'Avenue du Trône qui la prolonge vers l' est, et la Foire du Trône.
En 1660, Louis XIV et sa jeune femme, l'infante Marie-Thérèse, y firent leur entrée dans Paris. Un trône y fut élevé à cette occasion, d'où le nom qui fut donné à la place, et le roi y reçut les hommages de la Ville. ", url_image: "https://tse4.mm.bing.net/th?id=OIP.CWPTxC74DifA-YihlnpAPQHaFY&pid=Api&P=0")
Place.create(address: "139 rue de Charonne, 75011, Paris", geo_lat: 48.85542590348637, geo_long: 2.387642541645197, name: "Un numéro gravé", description: "A la hauteur du 139 rue de Charonne, vous pouvez voir l'ancien numéro de l'immeuble (n°23) gravé dans la pierre, l'un des derniers qui subsistent dans Paris.", url_image: "https://tse3.mm.bing.net/th?id=OIP.USEYvwgVlrFQibJTQJ97ugHaFj&pid=Api&P=0")
Place.create(address: "Place de la Bastille, 75011, Paris", geo_lat: 48.853399637309415, geo_long: 2.3690805112102, name: "Un petit malin expert en marketing !", description: "Le 14 juillet 1789, l'antre du despotisme, la Bastille, fut prise par les émeutiers. Ils n'y découvrirent que 7 prisonniers... Un certain Palloy se chargea de commercialiser les vestiges de la forteresse. Il s'enrichit en vendant des pierres de la Bastille et des médailles fabriquées avec les chaînes du pont-levis, frappées de la fière devise: La Liberté ou la Mort. Un as du marketing, à défaut d'être un vrai patriote.", url_image: "https://tse2.mm.bing.net/th?id=OIP.6pnyXVxDUNAj_-IDyDwM3wHaE8&pid=Api&P=0")
puts "places created"

puts "creating trips"
Trip.create(name: "Balade historique dans le 11ème", category: "Histoire")
Trip.create(name: "Balade gastronomique dans le 11ème", category: "Gastronomie")
Trip.create(name: "Balade insolite dans le 11ème", category: "Insolite")
puts "trips created"

puts "assigning Places to trip 1"
TripPlace.create(trip_id: 1, place_id: 1)
TripPlace.create(trip_id: 1, place_id: 2)
TripPlace.create(trip_id: 1, place_id: 3)
TripPlace.create(trip_id: 1, place_id: 4)
TripPlace.create(trip_id: 2, place_id: 1)
TripPlace.create(trip_id: 2, place_id: 2)
TripPlace.create(trip_id: 3, place_id: 3)
TripPlace.create(trip_id: 3, place_id: 4)
puts "assigned Places to trip 1"

puts "creating categories"
Category.create(name: "Histoire")
Category.create(name: "Personnages Historique")
Category.create(name: "Gastronomie")
Category.create(name: "Insolite")
Category.create(name: "Divertissement")
puts "created categories"

puts "creating categories and trips association"
PlaceCategory.create(place_id: 1, category_id: 1)
PlaceCategory.create(place_id: 2, category_id: 1)
PlaceCategory.create(place_id: 3, category_id: 4)
PlaceCategory.create(place_id: 4, category_id: 1)
puts "creating categories and trips association"

puts "creating admin user"
User.create(
  # first_name: 'admin',
  # last_name: 'admin',
  # username: 'admin',
  email: 'admin@admin.com',
  password: 'adminadmin',
  profile_pic: 'https://tse2.explicit.bing.net/th?id=OIP.P6yvfMfNsSgGQY8OyTRzJAHaHc&pid=Api&P=0'
)
puts "creating admin user created"
