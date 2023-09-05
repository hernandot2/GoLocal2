// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MapController from "./map_controller"
application.register("map", MapController)

import UniversalSearchController from "./universal_search_controller"
application.register("universal-search", UniversalSearchController)

import OpenLogin from "./open_login"
application.register("open-login", OpenLogin)

// import FavoriteController from "./favorite_controller"
// application.register("favorite-controller", FavoriteController)
