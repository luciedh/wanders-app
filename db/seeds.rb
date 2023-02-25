
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
require "open-uri"

puts "Clearing seed"
User.destroy_all
Place.destroy_all
Trip.destroy_all
TripPlace.destroy_all
Category.destroy_all
PlaceCategory.destroy_all
FavouritePlace.destroy_all
Comment.destroy_all
puts "Seed cleared"

# Places
puts "Creating Places"
Place.create(address: "13-15 Rue de la Croix Faubin, 75011 Paris", geo_lat: 48.8588989954928, geo_long: 2.3853346295266062, name: "La machine du bon docteur Guillotin", description: "A l'angle des rues de la Croix Faubin et de la Roquette, vous remarquerez sur le sol 5 dalles rectangulaires en granit, encastrées dans le sol. Elles servaient de points d'appui aux montants de l'échafaud, la guillotine, qui était installée devant la prison de la Grande Roquette, dont il ne subsiste plus rien. En 1871, le directeur de la prison de la Roquette avait offert a contrecoeur (car il avait été surpris en train de les desceller pour son compte personnelles) cinq pierres au Musée Carnavalet, qui les refusa. Elles furent donc replacées à quelques mètres de  leur emplacement primitif dans une forme de croix de St André, non pas en forme de vraie croix chrétienne comme auparavant.
Mais il exista d'autres lieux pour les exécutions capitales: de 1792 à 1832, place de Grève (actuelle place de l'Hôtel de Ville), de 1832 à 1851, sur l'actuelle place St Jacques, à partir de 1899, devant puis dans la prison de la Santé.", url_image: "https://tse2.mm.bing.net/th?id=OIP.8yZ5qjMJGUAeplr374kimwHaDx&pid=Api&P=0", poi_id: 1, average_rating: 3, audio_file: "https://res.cloudinary.com/dni212b6h/video/upload/v1677315200/development/iqnlep38sw2q9ezka2lo1gjvx554.mp3")
Place.create(address: "Place de la nation, 75011, Paris", geo_lat: 48.8486157470653, geo_long: 2.395792536220951, name: "Une place à l'histoire bien occultée", description: "La Place de la Nation, célèbre étape des manifestations parisiennes, est un symbole républicain très présent, encore de nos jours. Elle ne prit son nom actuel qu'en 1880, pour la fête nationale. Sait-on cependant qu'elle fut le théâtre d'événements dramatiques, aujourd'hui opportunément occultés ? Autrefois appelée Place du Trône, elle prit tout naturellement le nom de Place du Trône Renversé lors de la Révolution. Et c'est là que furent sommairement exécutés à cette époque des centaines de victimes innocentes: femmes, enfants, vieillards... On en conserve le souvenir avec l'Avenue du Trône qui la prolonge vers l' est, et la Foire du Trône.
En 1660, Louis XIV et sa jeune femme, l'infante Marie-Thérèse, y firent leur entrée dans Paris. Un trône y fut élevé à cette occasion, d'où le nom qui fut donné à la place, et le roi y reçut les hommages de la Ville. ", url_image: "https://tse4.mm.bing.net/th?id=OIP.CWPTxC74DifA-YihlnpAPQHaFY&pid=Api&P=0", poi_id: 4, average_rating: 4, audio_file: "https://res.cloudinary.com/dni212b6h/video/upload/v1677315714/development/g8mz2nzoin2d1p7bqzbcet8fk0db.mp3")
Place.create(address: "139 rue de Charonne, 75011, Paris", geo_lat: 48.85542590348637, geo_long: 2.387642541645197, name: "Un numéro gravé", description: "A la hauteur du 139 rue de Charonne, vous pouvez voir l'ancien numéro de l'immeuble (n°23) gravé dans la pierre, l'un des derniers qui subsistent dans Paris.", url_image: "https://tse3.mm.bing.net/th?id=OIP.USEYvwgVlrFQibJTQJ97ugHaFj&pid=Api&P=0", poi_id: 2, average_rating: 5, audio_file: "https://res.cloudinary.com/dni212b6h/video/upload/v1677315715/development/4q9j15npwsutasxym6lpsm24h5g2.mp3")
Place.create(address: "Place de la Bastille, 75011, Paris", geo_lat: 48.853399637309415, geo_long: 2.3690805112102, name: "Un petit malin expert en marketing !", description: "Le 14 juillet 1789, l'antre du despotisme, la Bastille, fut prise par les émeutiers. Ils n'y découvrirent que 7 prisonniers... Un certain Palloy se chargea de commercialiser les vestiges de la forteresse. Il s'enrichit en vendant des pierres de la Bastille et des médailles fabriquées avec les chaînes du pont-levis, frappées de la fière devise: La Liberté ou la Mort. Un as du marketing, à défaut d'être un vrai patriote.", url_image: "https://tse3.mm.bing.net/th?id=OIP.u2Btm6-ZsFcU98YGb7xtiAHaDW&pid=Api&P=0", poi_id: 10, average_rating: 4, audio_file: "https://res.cloudinary.com/dni212b6h/video/upload/v1677315716/development/404hatu6ab2kah0yr7zl4y1atk3d.mp3")
Place.create(address: "Place de la Bastille, 75011, Paris", geo_lat: 48.853399637309415, geo_long: 2.3690805112102, name: "Les momies de la Bastille", description: "Sous la colonne, érigée au centre de la Place de la Bastille à la mémoire des insurgés des 3 Glorieuses, reposent les restes de 500 combattants de ces événements. Mais pas seulement ! Y reposent aussi des momies rapportées par Bonaparte de son expédition d'Egypte, et qui furent entreposées à cet endroit par erreur.", url_image: "https://tse3.mm.bing.net/th?id=OIP.eAidPqIegsqI4ld-L5MYTwHaFB&pid=Api&P=0", poi_id: 9, average_rating: 3, audio_file: "https://res.cloudinary.com/dni212b6h/video/upload/v1677315718/development/kx01gbglha0s6whhh5lswv140kar.mp3")
Place.create(address: "Place de la Bastille, 75011, Paris", geo_lat: 48.853399637309415, geo_long: 2.3690805112102, name: "Une statuette insolite", description: "Toujours à la Bastille. Les ouvriers qui creusaient le tunnel du Métropolitain, en 1905, découvrirent à 9m de profondeur, c'est à dire en-dessous des anciens fossés de la Bastille, une statuette égyptienne de 17cm de haut représentant Oushabti, statuette funéraire liée au culte d'Isis, de fabrication locale. C'est une preuve que le culte d'Isis a été pratiqué à Paris (Lutèce) depuis plus de 2000 ans!", url_image: "https://tse2.mm.bing.net/th?id=OIP._zZAQgMTZgGsjxO8GZMs7gHaFh&pid=Api&P=0", poi_id: 8, average_rating: 4, audio_file: "https://res.cloudinary.com/dni212b6h/video/upload/v1677315719/development/sck3y2bl6r2pz0mhvuisze6aw3yc.mp3")
Place.create(address: "Place Pasdeloup, 75011, Paris", geo_lat: 48.8640665096828, geo_long: 2.3670218601342174, name: "Un cirque ou un cinéma ?", description: "Le Cirque d'Hiver, Place Pasdeloup, abrita entre 1907 et 1923 un cinéma muet du groupe Pathé. L'édifice avait été construit en 1852 par Hittorff, architecte de la Ville de Paris, qui construisit entre autres la Gare du Nord.", url_image: "https://tse4.mm.bing.net/th?id=OIP.7kVYYa56KzAFEAQDoZMOrAEsDH&pid=Api&P=0", poi_id: 23, average_rating: 5)
Place.create(address: "77 Boulevard de Belleville, 75011, Paris", geo_lat: 48.87138796071687, geo_long: 2.377419582119034, name: "Des célébrités bienveillantes", description: "L'ensemble scolaire situé au 77 Boulevard de Belleville, si imposant soit-il, ne présenterait pas d'intérêt particulier, si la rigueur extrême de la façade n'avait été volontairement cassée par l'architecte, qui l'a décorée des portaits peints dans des médaillons de quelques figures françaises marquantes: Charles Péguy, Jean Jaurès, Jules Ferry, Claude Debussy, Camille Claudel, Sadi Carnot, Emile Zola, Louis Pasteur, Marie Curie, Ernest Renan, Poincaré, Monet, Bergson et enfin Ledru-Rollin.", url_image: "https://tse1.mm.bing.net/th?id=OIP.OuFrw8kD2G6nShrulpvF8wAAAA&pid=Api&P=0")
Place.create(address: "Cour Damoye, 75011, Paris", geo_lat: 48.8548036781665, geo_long: 2.3706863625531613, name: "Une cité où l'on aimerait vivre...", description: "La cour Damoye... Si vous ne la connaissez pas, courez-y ! Cette rue privée reliant la place de la Bastille à la rue Daval est une ancienne cité ouvrière du 19è siècle, qui a pu conserver, malgré l'appétit des promoteurs, son caractère et sa tranquillité. Longue de 120m, elle fut le théâtre du tournage de nombreux films. Les bâtiments sont signalés par des plaques aux noms évocateurs: Les philosophes, Les étudiants, Les amoureux, Les artisans...", url_image: "https://tse4.mm.bing.net/th?id=OIP.sDQhhgNsGaf_x7HxMAYtaQHaHa&pid=Api&P=0", poi_id: 26, average_rating: 4)
Place.create(address: "Rue des Boulets, 75011, Paris", geo_lat: 48.85213110334527, geo_long: 2.3890945371090444, name: "La rue mal nommée", description: "La rue des Boulets n'a rien à voir avec les projectiles envoyés par les canons d'antan. Il s'agit en fait d'une déformation d'une ancienne ... plantation de bouleaux !", url_image: "https://tse4.mm.bing.net/th?id=OIP.5WEHnrLNJ6_fVsex34p5zAHaE6&pid=Api&P=0")
Place.create(address: "201 bd Voltaire, 75011, Paris", geo_lat: 48.852880413302344 , geo_long: 2.38902540924042, name: "Un hommage bien mérité", description: "Au 201 Boulevard Voltaire, un buste en ronde-bosse d'Alexandre Dumas rend hommage au grand romancier. Encastré dans une niche, encadré des palmes de la gloire, la liste de ses oeuvres est gravée au-dessus du buste, entre deux chaînages.", url_image: "https://tse4.mm.bing.net/th?id=OIP.M0SkAwy6Bsb8FnkEHILXsAHaE7&pid=Api&P=0", poi_id: 3, average_rating: 5, audio_file: "https://res.cloudinary.com/dni212b6h/video/upload/v1677315720/development/wa702910v2nmqgstgy76w32m3s5h.mp3")
Place.create(address: "Rue du Chemin Vert, 75011, Paris", geo_lat: 48.86016883778214, geo_long: 2.37808992444589, name: "Une rue bien nommée", description: "La rue du Chemin Vert rappelle la sente sinueuse de 1650, qui desservait les maraîchers avoisinants. Eh oui, à cette époque, nous étions à la campagne, à cet endroit !", url_image: "https://tse1.mm.bing.net/th?id=OIP.umeXT4rF3D-sPPlP49wWIQHaEK&pid=Api&P=0")
Place.create(address: "177 rue de Charonne, 75011, Paris", geo_lat: 48.8561358062093, geo_long: 2.39214345513626, name: "Paroisse en sous-sol", description: "Vous ne trouverez pas facilement l'église du Bon Pasteur. Pour une bonne raison: elle est invisible depuis la rue. Pour y accéder, vous devrez passer sous une dalle de béton, surplombée d'habitations à loyer modéré et descendre largement sous le niveau de la rue.
Située 177 rue de Charonne, elle est, comment dire, très sobre. A vrai dire, peu de décoration, un énorme chaudron en cuivre faisant office de fonds baptismaux, et c'est à peu près tout!
Il ne reste de l'ancienne église située à la même adresse, mais en surface, que le motif sculpté que l'on peut voir sur le champ du mur pignon.", url_image: "https://tse1.mm.bing.net/th?id=OIP.FjURZQwhSm2grDyrTyFaaAHaEo&pid=Api&P=0")
Place.create(address: "42 rue Léon Frot, 75011, Paris", geo_lat: 48.8557591095392, geo_long: 2.38673115342297, name: "Une association incroyable" , description: "L' Association des Vignerons de Paris existe bel et bien ! En fait, son siège est situé près du métro Charonne, 42 rue Léon Frot. Peuvent y adhérer tous les Parisiens ayant au moins un pied de vigne, qu'ils cultivent amoureusement dans leur jardinet, sur leur balcon ou leur terrasse. Les 20 (sans jeu de mots) arrondissements de Paris sont contributeurs, et au total plus de 250 membres font partie du club. Le jus des terroirs indigènes de nos 20 arrondissements sont collectés une fois par an, et mélangés, pour donner naissance à environ 1 000 bouteilles, le Clos Montmartre, vendues au profit d'une oeuvre caritative. L'étiquette est dessinée par un artiste contemporain différent chaque année.", url_image: "https://tse2.mm.bing.net/th?id=OIP.fEdK-JeuGkuiD4_qvM8qJgHaFj&pid=Api&P=0")
Place.create(address: "Rue de la Roquette, 75011, Paris", geo_lat: 48.856222754477, geo_long: 2.37618645347307, name: "Un zouave guérisseur qui jouait du trombone !", description: "Cumuler ces trois particularités n'est pas banal, reconnaissons-le. C'est pourtant l'histoire singulière du zouave Jacob, né en 1829. Tenu pour un grand guérisseur, il officia pendant des décennies rue de la Roquette. Son succès était tel que, près d'un siècle après sa disparition (il est décédé en 1913), ses admirateurs viennent toujours fleurir sa tombe, au cimetière de Gentilly. Sur celle-ci on peut lire: Iessus Christina, rédempteur des Indous. Véridique !
On sait de lui qu'il jouait du trombone à ses clients après chaque consultation, et qu'on lui attribuait le pouvoir de guérir toutes les maladies; on venait de très loin pour le consulter, même de l'étranger !
Ce fut aussi le créateur de la psycho-hypnothérapie de groupe.
Comme quoi, on peut faire le zouave et réussir dans la vie !", url_image: "https://tse1.mm.bing.net/th?id=OIP.uG-EDvCLFROCgn5ocD3TUgHaIv&pid=Api&P=0")
Place.create(address: "Place de la Bastille, 75011, Paris", geo_lat: 48.853399637309415, geo_long: 2.3690805112102, name: "Une curieuse fontaine", description: "En 1793, on éleva place de la Bastille une curieuse fontaine en plâtre: la Régénération, statue qui se pressait les seins des deux mains pour en faire sortir des trombes d'eau. En 1808, un éléphant en bois et en plâtre de 15 mètres de haut prit sa place, ébauche d'une fontaine qui servit de refuge à Gavroche  selon les Misérables. Le pachyderme fut démoli en 1847, et remplacé par la Colonne de Juillet, construite en souvenir des Trois Glorieuses (27, 28, 29 juillet 1830). C'est là que, le 27 février 1848, la République est officiellement proclamée, et le trône de Louis-Philippe publiquement brûlé. Plus tard, les Communards tentèrent vainement de l'abattre, en 1871.", url_image: "https://tse4.mm.bing.net/th?id=OIP.qDcdB_uif_9jn39Dr0yUKQHaFM&pid=Api&P=0")
Place.create(address: "12 Pl. Léon Blum, 75011 Paris", geo_lat: 48.8589221744999, geo_long: 2.37950524164534, name: "Le modèle des mairies haussmanniennes", description: "La mairie du 11ème arrondissement fut considérée par ses contemporains comme le modèle de référence pour d'autres réalisations. Une imposante façade, un accès aux différents services (modernes pour l'époque): état-civil, justice de paix, bureau de bienfaisance, caisse des écoles... , qui s'organise autour d'une cour centrale, un escalier d'honneur conduisant au bureau du maire, à la salle des mariages et à la salle des fêtes. Tout cela en fit réellement un modèle.", url_image: "https://tse4.mm.bing.net/th?id=OIP.WDI8MX-c-ZiyWLnPUuTm7QHaD4&pid=Api&P=0")
Place.create(address: "50 bd du Temple, 75011, Paris", geo_lat: 48.8661535477421, geo_long: 2.36536628397305, name: "Le grognard revanchard et repenti", description: "Ancien grognard de la Grande Armée, et Corse de surcroît, Joseph Fieschi a très mal vécu la chute de l'Empereur, et le rétablissement de la royauté. Ne pouvant se résoudre à vivre honnêtement de son travail, il végète pendant des années et se lance dans une carrière de délinquant. Sa rencontre avec un autre bonapartiste convaincu, Morey, scellera son destin. Installé au 50, boulevard du Temple, Fieschi confectionne une machine infernale avec l'aide d'un ancien artificier. Le 28 juillet 1835, Louis-Philippe et son escorte passent devant l'appartement de Fieschi. Les vingt-cinq canons de sa machine tirent en même temps sur le cortège royal. On dénombrera 18 tués et 22 blessés. Un vrai massacre, dont réchapperont par miracle le roi et ses deux fils. Ironie de l'histoire: parmi les victimes, on compte le maréchal Mortier, un ancien compagnon de l'Empereur...
Quand aux conspirateurs, ils seront guillotinés le 19 février 1836. Fieschi, pour sa part, la tête sur l'échafaud, demanda pardon à Dieu et aux hommes. Mieux vaut tard que jamais...", url_image: "https://tse2.mm.bing.net/th?id=OIP.ylKctxuCk8wlYGH6p92j1AHaI_&pid=Api&P=0", poi_id: 11, average_rating: 3, audio_file: "https://res.cloudinary.com/dni212b6h/video/upload/v1677315721/development/5ghyhqk2gekcbsx14hke05wbsjs5.mp3")
Place.create(address: "rue des Immeubles Industriels", geo_lat:48.8501127759293, geo_long:2.39258386677275, name: "Une cité bien nommée", description: "La Cité de la rue des Immeubles Industriels, quant à elle, fut construite en 1873, dans le quartier du faubourg St Antoine. Composée de 17 immeubles de conception identique, une machine à vapeur en sous-sol fournissait l’énergie nécessaire aux ateliers situés aux trois premiers niveaux. Les logements occupaient les niveaux supérieurs. Plus de deux mille personnes, les artisans et leurs familles vivaient à cet endroit.", url_image: "https://tse4.mm.bing.net/th?id=OIP.V6rwQQsb0CO8_bEvF5PTDQHaD6&pid=Api&P=0")
Place.create(address: "Rue de la Folie Méricourt", geo_lat:48.865393859569, geo_long:2.37078067099326, name: "Drôle de folie !", description: "La rue de la Folie-Méricourt mérite que l'on s'y attarde un peu. Ne serait-ce que pour expliquer l'origine de ce nom si curieux.
Rappelons qu'une folie était, au 17è siècle, une maison d'agrément. On dirait plus prosaïquement aujourd'hui une (très) belle maison de campagne. Les riches Parisiens y venaient de temps en temps prendre le bon air de la campagne. Eh oui, le 11è arrondissement, comme tous les arrondissements qui étaient hors les murs de Paris à l'époque, c'était la campagne ! On s'en servait comme relais de chasse, ou comme lieu de rendez-vous galant... Bon, folie, vous avez compris. Mais pourquoi Méricourt ? Nos ancêtres se transmettaient les informations de manière très souvent orale, car peu d'entre eux savaient lire et écrire. Eh bien, imaginez qu'un certain Monsieur Marcout, maître de la corporation des épiciers-apothicaires, fit construire cette folie pour son propre usage. Au fil du temps, son nom fut déformé en Mauricout, Mauricourt, Moricourt et enfin, Méricourt. CQFD.", url_image: "https://tse1.mm.bing.net/th?id=OIP.h7sOox8yX5PXDX0FlRlxJwHaFj&pid=Api&P=0")
Place.create(address: "130 du boulevard Richard-Lenoir, 75011, Paris", geo_lat:48.8658361036396, geo_long:2.3701286669175, name: "Qui était Richard-Lenoir ?", description: "On devrait plutôt dire: qui étaient Richard et Lenoir ?
Le boulevard Richard-Lenoir est emblématique du 11è arrondissement. Mais quelle est son origine ? Revenons quelques siècles en arrière. En 1799, plus exactement. François Richard et Jean-Daniel Lenoir y ouvrirent, cette même année, une importante filature de coton, dans les locaux des religieuses de Notre-Dame du Bon Secours, expulsées à la Révolution. Leur entreprise connut une rapide expansion, malgré le blocus des matières premières organisé par les Anglais, alors en guerre contre Napoléon 1er. A la mort de Lenoir, en 1806, François Richard reprit le patronyme de ce dernier, et devint Richard-Lenoir. En 1810, l'entreprise employait 15 000 ouvriers dans ses établissements de Normandie et de Picardie, et 3 500 dans sa filature parisienne. L'instauration de taxes très lourdes sur le coton, à la Restauration, fit disparaître l'entreprise.
C'est aussi au n°130 du boulevard Richard-Lenoir que l'écrivain Simenon a domicilié le célèbre commissaire Maigret.", url_image: "https://tse2.mm.bing.net/th?id=OIP.VgtFy5uvSteVGmIZQnpQ-AHaIT&pid=Api&P=0", poi_id: 12, average_rating: 4, audio_file: "https://res.cloudinary.com/dni212b6h/video/upload/v1677315723/development/1ovke6xevpxhbn3ox52qwxhmf4t9.mp3")
Place.create(address: "Place de la République, 75011, Paris", geo_lat:48.8673728339802, geo_long:2.36292406089049, name: "Le Grand Cirque", description: "Place de la République, à l'angle de la rue du faubourg du Temple, se trouve l'ancien immeuble des Magasins Réunis. Créé en 1865, sa façade est décorée de motifs ornementaux parmi lesquels les figures de Mercure et de Vulcain, symbolisant le commerce et le travail. La Société des Magasins Réunis loua l'immeuble pour rassembler des commerçants indépendants, désireux de vendre à bon marché. Trois ans plus tard, la Société fit faillite et fut dissoute. L'immeuble fut alors racheté par J W Myers, qui y aménagea le Grand Cirque Américain, qui, fort de plus de 5 000 places, y restera jusqu'en 1893.", url_image: "https://tse2.mm.bing.net/th?id=OIP.dprqKQRjKP-YnwqpLUI-fAHaFV&pid=Api&P=0")
Place.create(address: "Bd des Filles du Calvaires, 75011, Paris", geo_lat:48.8626914603265, geo_long:2.36687176306481, name: "Un bien sinistre 15 juillet", description: "Le 15 juillet 1862 restera à jamais comme l'une des dates les plus tristes de l'histoire de Paris. Ce jour-là, Haussmann commença les travaux de percement des futurs boulevards Beaumarchais et des Filles du Calvaire. Tous les théâtres du boulevard du Temple, rebaptisé à l'époque le boulevard du Crime, en raison des spectacles mélodramatiques et sanglants qui s'y jouaient, donnèrent leur dernière représentation. Seuls trois théâtres furent épargnés, et reconstruits place du Châtelet et boulevard St Martin.", url_image: "https://tse1.mm.bing.net/th?id=OIP.Bmwm4Ns-3Lxn6ty7sdgUpAHaGP&pid=Api&P=0")
Place.create(address: "110 Rue Amelot, 75011 Paris", geo_lat:48.8634631995514, geo_long:2.36712569389879, name: "Un architecte éclectique", description: "Si je vous dis: Jacques Hittorff, ce nom ne vous dit peut-être pas grand-chose. Et pourtant, ce grand architecte du 19è siècle a construit: les fontaines de la place de la Concorde, la place du Louvre, la mairie du 1er arrondissement, la place de l'Etoile et ses hôtels, l'avenue Foch, la Gare du Nord, et j'en passe...
Il se vit confier en 1852, par l'empereur Napoléon III, la construction d'un cirque couvert permanent, où les Parisiens de l'est  de la capitale pourraient admirer les mêmes spectacles équestres que ceux auxquels avaient droit ceux de l'ouest parisien, au Cirque des Champs-Elysées, près du Carré Marigny. En 6 mois, le bâtiment fut achevé: c'est maintenant le Cirque d'Hiver que vous connaissez.
Inauguré le 11 décembre 1852, il s'appela tout d'abord Cirque Napoléon. Depuis, il fut transformé par les Frères Pathé' en cinéma avec accompagnement d'orchestre en 1907. Pendant les Jeux Olympiques de Paris en 1924, il accueillit des épreuves olympiques. Après bien d'autres avatars, il fit faillitte en 1934, et fut repris par les Frères Bouglione, qui lui rendirent sa vocation initiale: le cirque.", url_image: "https://tse1.mm.bing.net/th?id=OIP.xA5SjqpO18xKcNdyHRlW9wHaFU&pid=Api&P=0", poi_id: 22, average_rating: 5)
Place.create(address: "50 rue de Malte, 75011, Paris", geo_lat:48.8672764717343, geo_long:2.36693999746414, name: "Triste destinée", description: "Au n°50 de la rue de Malte s'élevait la façade du Théâtre du Prince Impérial. Inauguré le 11 août 1866, on y donna des spectacles de cirque jusqu'en 1869, date à laquelle il fut rebaptisé Théâtre du Château d'eau. En 1881, il devint un opéra populaire. En 1903, il prit le nom d'Alhambra, et fut alors, avec ses 2 500 places, l'un des plus grands théâtres de Paris. En 1956, on lui adjoignit le nom de Maurice Chevalier. Et enfin, il fut détruit, en 1967, et remplacé par un banal immeuble d'habitation. Quelle tristesse !", url_image: "https://tse4.mm.bing.net/th?id=OIP.qYP4wIYenIXzQ4pGSrMVJAHaE3&pid=Api&P=0", poi_id: 21, average_rating: 3)
Place.create(address: "94 rue du faubourg du Temple, 75011, Paris", geo_lat:48.8711447196216, geo_long:2.37425481095536, name: "Les débuts de Momo", description: "Au 94 rue du faubourg du Temple, dans le passage Pivert, se trouvait le théâtre du Tambour Royal. Dès 1897, le comique y était à l'honneur. C'est en 1902 qu'un jeune homme, inconnu, se présenta et y fut engagé en supplément de programme.
Il s'appelait Maurice Chevalier, et fut appelé à un brillant avenir. Avez-vous vu le nouveau chapeau de Toto ? Prosper Youp la boum, c'est le chéri de ces dames...Ah, les gars d'Ménilmontant...", url_image: "https://tse2.explicit.bing.net/th?id=OIP.1-kS9w0_IeXJhNXXs53jNQHaHa&pid=Api&P=0", poi_id: 20, average_rating: 4)
Place.create(address: "161 rue Saint Maur, 75011, Paris", geo_lat:48.8691274682326, geo_long:2.37412426691861, name: "Une église pour champ de bataille", description: "L'église St Joseph des Nations s'élève au 161 de la rue St Maur. Achevée en 1875, elle fut le théâtre, si l'on peut dire, de violents événements.
Lors du second procès en révision du capitaine Dreyfus, le dimanche 20 août 1899, Sébastien Faure, directeur du quotidien anarchiste Le journal du peuple, avait appelé à une manifestation de soutien place du Château d'eau. Celle-ci se heurta à une contre-manifestation des partisans de Jules Guérin, directeur de L'antijuif. De violentes bagarres éclatèrent, à la suite desquelles une fraction des émeutiers vint piller l'église, et brûla du mobilier sur le parvis. Nos grands-parents ne rigolaient pas avec la politique...", url_image: "https://tse4.mm.bing.net/th?id=OIP.0Yqt5XsH8iVKv7N5_uwcgAHaJ4&pid=Api&P=0")
Place.create(address: "rue Charles Luizet, 75011, Paris", geo_lat:48.8616543958546, geo_long:2.36739168397283, name: "Les quatre rues inhabitées", description: "Si vous vous promenez du côté de la rue Oberkampf, vous remarquerez qu'elle est reliée à la rue du Chemin Vert par quatre rues très courtes: la rue Charles Luiset, la rue Marcel Gromaire, la rue Scarron et la rue Clotilde de Vaux. En fait ces rues sont des escaliers, qui ne portent aucun numéro, et sont donc inhabitées.", url_image: "https://tse4.mm.bing.net/th?id=OIP.i1nvuc6xbWwPqK3qX-BCggHaFj&pid=Api&P=0")
Place.create(address: "50 Bd Voltaire, 75011 Paris", geo_lat:48.8631368681989, geo_long:2.37065869760711, name: "Le Ba-Ta-Clan", description: "La salle de music-hall qui a repris ce nom célèbre de la variété parisienne en 1983, n'a plus rien de commun avec son illustre ancêtre.
Au 50 boulevard Voltaire fut créé en 1864 le Grand Café Chinois, rebaptisé un peu plus tard le Ba-Ta-Clan. Celui-ci était bâti sur le modèle...d'une pagode chinoise !
A l'extérieur, on y admirait des belvédères, des dragons ailés, des petits singes accroupis, des lanternes, des étendards, des toitures en forme de sabot. A l'intérieur, les halls, la salle de café, les salles de billard et les escaliers étaient décorés de colonnes multicolores. Des cariatides soutenant le plafond représentaient des dragons et des chimères. Les murs étaient recouverts d'une toile peinte rappelant la vie et les moeurs chinoises. Sur la scène étaient dressés des temples, des pagodes et même deux cascades d'eau naturelle, colorée en bleu et en jaune, évoquant le Fleuve Bleu et le Fleuve Jaune. Le rideau, en forme d'éventail, ne se levait pas, il s'écartait. Dans ce décor exotique, parmi les statues chinoises, les paravents et les mandarins, on dégustait des chinois, en écoutant une chanteuse appelée tout naturellement Mandarine. A son répertoire, entre autres oeuvres, l'opérette d'Offenbach: Ba-Ta-Clan, chinoiserie musicale selon son auteur.
En 1870, le théâtre fut le lieu de réunions politiques, auxquelles assistèrent Ledru-Rollin, Victor Hugo, Jules Ferry, Charles Floquet et Jules Simon.
En 1892, Paulus, le roi du café-concert, racheta le Ba-Ta-Clan et y produisit des artistes de talent: Aristide Bruant, et un certain William Cody, un américain plus connu sous le nom de ...Buffalo Bill ! En 1909, Maurice Chevalier y était en vedette. En 1932, la salle fut aménagée en cinéma parlant et en 1950 elle fut fermée par la Ville de Paris, pour cause de vétusté. Elle renaquit de ses cendres en 1952, sous forme de cinéma, et devint à partir de 1971 une salle de spectacle, ce qu'elle est restée.depuis. La boucle est bouclée.", url_image: "https://tse4.mm.bing.net/th?id=OIP.MWsgsvzBdZO8ujVhn_8I1gHaFW&pid=Api&P=0", poi_id: 24, average_rating: 4)
Place.create(address: "60 rue Saint Sabin, 75011, Paris", geo_lat:48.8592530759587, geo_long:2.36880422444583, name: "L'accessoiriste de cinéma", description: "Décidément, on parle beaucoup de spectacles, de music-halls et de théâtres dans cet arrondissement. C'est normal, nous étions de l'autre-côté de la barrière des Fermiers Généraux, cette enceinte fiscale qui enserrait Paris jusqu'en 1860. Les spectacles, comme les cabarets et les autres commerces, étaient alors détaxés, donc...moins chers.
Eh bien, maintenant, parlons un peu de cinéma. Au n°60 de la rue St Sabin, derrière un portail, un étroit passage abrité par une verrière recèle un prodigieux bric-à-brac. C'est une (petite) partie des trésors de la Société Régifilm, qui fournit au 7è art tout ce dont on peut avoir besoin en matière de mobilier urbain, décors ou costumes.
Etonnant !", url_image: "https://tse2.mm.bing.net/th?id=OIP.VH04rZBPHp8XPPUAhLKWhgEyDL&pid=Api&P=0", poi_id: 25, average_rating: 5)
Place.create(address: "rue de Lappe, 75011, Paris", geo_lat:48.8535120780864, geo_long:2.37310903742532, name: "Coopération franco-italienne", description: "Rue de Lappe, près de la Bastille, il y a le célèbre Balajo. C'est là que le bal-musette (Viens poupoule, viens poupoule, viens...) y a gagné ses lettres de noblesse. Encore de nos jours, on vient y danser la valse-musette et d'autres danses populaires. Mais le bal musette n'est pas né tout seul. C'est sous l'impulsion des immigrés italiens, arrivés en masse à Paris dans les années 1920-1930, pour fuir le fascisme, qu'il est né. En effet, nombreux à s'être installés dans le faubourg St Antoine pour y travailler le bois (des Gepetto, en somme...), ils confrontèrent leur sens de la fête avec les Auvergnats, très présents aussi dans le quartier, pour donner naissance au bal musette.", url_image: "https://tse1.mm.bing.net/th?id=OIP.5NeGylTbdfhvcNHitvaeQAHaE6&pid=Api&P=0", poi_id: 27, average_rating: 5)
Place.create(address: "Place de la Bastille, 75011, Paris", geo_lat:48.853399637309415, geo_long:2.3690805112102, name: "Le premier hôte de la Bastille...", description: "... fut son bâtisseur ! Vers 1367, le prévôt Hugues Aubriot décida de poser la première pierre de la Bastille. Elle était destinée à assurer la protection orientale de Paris contre les Anglais. Par suite de manque de main d'oeuvre, et comme il fallait faire vite, Aubriot fut contraint d'employer le système de la presse. des archers sillonnaient les rues avoisinnantes, et raflant tous les oisifs, les réquisitionnaient pour travailler sur le chantier. Le mécontentement fut général et les plaintes si nombreuses que le malheureux prévôt, disgracié, fut le premier prisonnier de la Bastille, achevée en 1382.", url_image: "https://tse3.mm.bing.net/th?id=OIP.u2Btm6-ZsFcU98YGb7xtiAHaDW&pid=Api&P=0", poi_id: 7, average_rating: 5, audio_file: "https://res.cloudinary.com/dni212b6h/video/upload/v1677315724/development/vqheoojsir6o3qnwcz1l6svmuaeb.mp3")
Place.create(address: "132 bd Richard Lenoir, 75011, Paris", geo_lat: 48.8660998528062, geo_long: 2.37006502459025, name: "Jules et sa pipe", description: "Au 132 boulevard Richard Lenoir, Georges Simenon a logé son héros, le commissaire Jules Maigret. Célèbre pour sa capacité à décortiquer la personnalité des protagonistes de l'affaire, il vivait dans un quartier populaire, où il vit modestement. Il aime à se retrouver avec son épouse, Louise, qui lui préparait de bons petits plats.", url_image: "https://tse3.mm.bing.net/th?id=OIP.mBUBJ2Vur-fAZ45p16CFpgHaF6&pid=Api&P=0", poi_id: 13, average_rating: 5, audio_file: "https://res.cloudinary.com/dni212b6h/video/upload/v1677315725/development/in3yi19dstq2aklnkidje3exm1hq.mp3")
Place.create(address: "rue du Faubourg Saint Antoine, 75011, Paris", geo_lat: 48.8508813071809, geo_long: 2.37782516664346, name: "Un évêque sur des barricades ?", description: "Rue du Faubourg St Antoine, tout près de la place de la Bastille, mourut Monseigneur Affre, archevêque de Paris. Il y fut mortellement blessé, le 25 juin 1848, sur une barricade, où il a vainement tenté de s'interposer pour éviter toute effusion de sang.", url_image: "https://tse2.mm.bing.net/th?id=OIP.w1dL2WCSb0oHBdAr_9vBAQAAAA&pid=Api&P=0", poi_id: 5, average_rating: 4, audio_file: "https://res.cloudinary.com/dni212b6h/video/upload/v1677315727/development/97eujntpyj19exr3wcugpugx74f0.mp3")
Place.create(address: "Brasserie le Centenaire, rue Amelot, 75011, Paris", geo_lat: 48.8651735198277, geo_long: 2.36687779585479, name: "Comme un arbre dans la ville", description: "A l'angle de la rue Amelot et de la rue Oberkampf, si vous regardez la brasserie Le Centenaire, vous découvrirez avec surprise ... un frêne qui semble sortir de la terrasse ! L'effet est vraiment surprenant, et le nom de la brasserie n'a rien à voir avec l'âge de l'arbre... Il rappelle que la boutique fut fondée 100 ans pile-poil après la Révolution, en 1889. ", url_image: "https://tse2.mm.bing.net/th?id=OIP.zvDtgolvEc0kepsH1cfRSwHaE4&pid=Api&P=0")
puts "Places created"

# Attach audio


#puts "Attaching audio to trip 1 places"
#[1, 2, 3, 4, 5, 6, 11, 18, 21, 32, 33, 34].each do |id|
  #place = Place.find(id)
  #path = Rails.root.join("app/assets/audio/place_id_#{id}_audio.mp3")
  #file = URI.open(path)
  #place.audio.attach(io: file, filename: "audio for place id: #{id}", content_type: "audio/mp3")
#end

# Trips


puts "Creating trips"
Trip.create(name: "A travers l'histoire de France", category: "Histoire", duration: 45, kms: 6)
Trip.create(name: "Pépites architecturales", category: "Architecture", duration: 30, kms: 4)
Trip.create(name: "Les soirées Parisiennes", category: "Divertissement", duration: 30, kms: 4)
Trip.create(name: "Curiosités", category: "Insolite", duration: 20, kms: 3)
puts "Trips created"




puts "assigning Places to trips"
# A travers l'histoire de France
TripPlace.create(trip_id: 1, place_id: 1)
TripPlace.create(trip_id: 1, place_id: 2)
TripPlace.create(trip_id: 1, place_id: 3)
TripPlace.create(trip_id: 1, place_id: 4)
TripPlace.create(trip_id: 1, place_id: 5)
TripPlace.create(trip_id: 1, place_id: 6)
TripPlace.create(trip_id: 1, place_id: 11)
TripPlace.create(trip_id: 1, place_id: 18)
TripPlace.create(trip_id: 1, place_id: 21)
TripPlace.create(trip_id: 1, place_id: 32)
TripPlace.create(trip_id: 1, place_id: 33)
TripPlace.create(trip_id: 1, place_id: 34)

# Les soirées Parisienne
TripPlace.create(trip_id: 2, place_id: 7)
TripPlace.create(trip_id: 2, place_id: 9)
TripPlace.create(trip_id: 2, place_id: 24)
TripPlace.create(trip_id: 2, place_id: 25)
TripPlace.create(trip_id: 2, place_id: 26)
TripPlace.create(trip_id: 2, place_id: 29)
TripPlace.create(trip_id: 2, place_id: 30)
TripPlace.create(trip_id: 2, place_id: 31)

# Pépites architecturales
TripPlace.create(trip_id: 3, place_id: 8)
TripPlace.create(trip_id: 3, place_id: 16)
TripPlace.create(trip_id: 3, place_id: 17)
TripPlace.create(trip_id: 3, place_id: 19)
TripPlace.create(trip_id: 3, place_id: 20)
TripPlace.create(trip_id: 3, place_id: 22)
TripPlace.create(trip_id: 3, place_id: 23)
TripPlace.create(trip_id: 3, place_id: 28)
# Curiosités
TripPlace.create(trip_id: 4, place_id: 10)
TripPlace.create(trip_id: 4, place_id: 13)
TripPlace.create(trip_id: 4, place_id: 14)
TripPlace.create(trip_id: 4, place_id: 15)
TripPlace.create(trip_id: 4, place_id: 27)
TripPlace.create(trip_id: 4, place_id: 35)
puts "Places to trips association completed"




puts "creating categories"
Category.create(name: "Histoire")
Category.create(name: "Personnages Historique")
Category.create(name: "Architecture")
Category.create(name: "Divertissement")
Category.create(name: "Eglise")
Category.create(name: "Gastronomie")
Category.create(name: "Insolite")
Category.create(name: "Nature")
puts "Categories completed"




puts "creating categories and places association"
PlaceCategory.create(place_id: 1, category_id: 1)
PlaceCategory.create(place_id: 2, category_id: 1)
PlaceCategory.create(place_id: 5, category_id: 1)
PlaceCategory.create(place_id: 6, category_id: 1)
PlaceCategory.create(place_id: 34, category_id: 1)
PlaceCategory.create(place_id: 4, category_id: 2)
PlaceCategory.create(place_id: 11, category_id: 2)
PlaceCategory.create(place_id: 18, category_id: 2)
PlaceCategory.create(place_id: 21, category_id: 2)
PlaceCategory.create(place_id: 32, category_id: 2)
PlaceCategory.create(place_id: 33, category_id: 2)
PlaceCategory.create(place_id: 3, category_id: 3)
PlaceCategory.create(place_id: 8, category_id: 3)
PlaceCategory.create(place_id: 16, category_id: 3)
PlaceCategory.create(place_id: 17, category_id: 3)
PlaceCategory.create(place_id: 19, category_id: 3)
PlaceCategory.create(place_id: 20, category_id: 3)
PlaceCategory.create(place_id: 22, category_id: 3)
PlaceCategory.create(place_id: 23, category_id: 3)
PlaceCategory.create(place_id: 28, category_id: 3)
PlaceCategory.create(place_id: 7, category_id: 4)
PlaceCategory.create(place_id: 9, category_id: 4)
PlaceCategory.create(place_id: 24, category_id: 4)
PlaceCategory.create(place_id: 25, category_id: 4)
PlaceCategory.create(place_id: 26, category_id: 4)
PlaceCategory.create(place_id: 29, category_id: 4)
PlaceCategory.create(place_id: 30, category_id: 4)
PlaceCategory.create(place_id: 31, category_id: 4)
PlaceCategory.create(place_id: 13, category_id: 5)
PlaceCategory.create(place_id: 27, category_id: 5)
PlaceCategory.create(place_id: 14, category_id: 6)
PlaceCategory.create(place_id: 15, category_id: 7)
PlaceCategory.create(place_id: 35, category_id: 8)
puts "Categories and places association completed"


puts "creating admin user"
User.create(
  # first_name: 'admin',
  # last_name: 'admin',
  # username: 'admin',
  email: 'admin@admin.com',
  password: 'adminadmin',
  profile_pic: 'https://tse2.explicit.bing.net/th?id=OIP.P6yvfMfNsSgGQY8OyTRzJAHaHc&pid=Api&P=0'
)
User.create(
  # first_name: 'admin',
  # last_name: 'admin',
  username: 'Clément P',
  email: 'Clement@gmail.com',
  password: 'adminadmin',
  profile_pic: 'https://avatars.githubusercontent.com/u/113604057?v=4'
)

User.create(
  # first_name: 'admin',
  # last_name: 'admin',
  username: 'Lucie L',
  email: 'luciedh@gmail.com',
  password: 'adminadmin',
  profile_pic: 'https://media.licdn.com/dms/image/D4E03AQEy_5mTJ7pTVA/profile-displayphoto-shrink_800_800/0/1666077959851?e=1682553600&v=beta&t=ionaX_84UNF60IseeH8vl36R7PkSGKKD8m429pGnMkg'
)
puts "creating admin user created"

puts "creating favourite places user 1"
FavouritePlace.create(user_id: 1, place_id: 1)
FavouritePlace.create(user_id: 1, place_id: 4)
FavouritePlace.create(user_id: 1, place_id: 18)
FavouritePlace.create(user_id: 1, place_id: 21)
puts "favourite places user 1 created"

puts "creating comments"
Comment.create(content: "Sous la colonne, érigée au centre de la Place de la Bastille à la mémoire des insurgés des 3 Glorieuses, reposent les restes de 500 combattants de ces événements. Mais pas seulement ! Y reposent aussi des momies rapportées par Bonaparte de son expédition d'Egypte, et qui furent entreposées à cet endroit par erreur.", rating: 0, user_id: 2, place_id: 4)
Comment.create(content: "Le premier hôte de la Bastille fut son bâtisseur ! Vers 1367, le prévôt Hugues Aubriot décida de poser la première pierre de la Bastille. Elle était destinée à assurer la protection orientale de Paris contre les Anglais. Par suite de manque de main d'oeuvre, et comme il fallait faire vite, Aubriot fut contraint d'employer le système de la presse. des archers sillonnaient les rues avoisinnantes, et raflant tous les oisifs, les réquisitionnaient pour travailler sur le chantier. Le mécontentement fut général et les plaintes si nombreuses que le malheureux prévôt, disgracié, fut le premier prisonnier de la Bastille, achevée en 1382.", rating: 0, user_id: 3, place_id: 4)
puts "comments created"
