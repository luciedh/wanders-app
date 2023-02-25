// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AddFavouriteController from "./add_favourite_controller"
application.register("add-favourite", AddFavouriteController)

import CategorySelectionController from "./category_selection_controller"
application.register("category-selection", CategorySelectionController)

import CommentSectionController from "./comment_section_controller"
application.register("comment-section", CommentSectionController)

import DisplayFavDescriptionController from "./display_fav_description_controller"
application.register("display-fav-description", DisplayFavDescriptionController)

import DisplayTripDetailsController from "./display_trip_details_controller"
application.register("display-trip-details", DisplayTripDetailsController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MapController from "./map_controller"
application.register("map", MapController)

import RatingsController from "./ratings_controller"
application.register("ratings", RatingsController)

import UserPlaceController from "./user_place_controller"
application.register("user-place", UserPlaceController)
