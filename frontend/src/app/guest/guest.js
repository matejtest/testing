
var guest_module = angular.module("guest", ["ui.router", "ui.bootstrap"]);

guest_module.config(["$stateProvider", function guestConfig($stateProvider) {

	$stateProvider.state("guest", {
		url: "/guest",
		controller: "GuestController",
		templateUrl: "guest/guest.tpl.html"
	});

}]);

guest_module.controller("GuestController", ["$scope", function GuestController($scope) {
	console.log("GuestController");
}]);