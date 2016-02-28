
var forbidden_module = angular.module("forbidden", []);

forbidden_module.config(["$stateProvider", function($stateProvider){

	$stateProvider.state("forbidden", {
		url: "/forbidden",
		templateUrl: "errors/forbidden.tpl.html",
		controller: "ForbiddenController"
	});

}]);

forbidden_module.controller("ForbiddenController", ["$scope", function($scope){
	console.log("ForbiddenController");
}]);