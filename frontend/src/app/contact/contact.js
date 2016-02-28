
var contact_module = angular.module("contact", ["ui.router", "ui.bootstrap"]);

contact_module.config(["$stateProvider", function contactConfig($stateProvider){
	$stateProvider.state("contact", {
		url: "/contact",
		controller: "ContactController",
		templateUrl: "contact/contact.tpl.html",
		data: {pageTitle: " - Contact"}
	});
}]);

contact_module.controller("ContactController", ["$scope", function ContactController($scope){
	console.log("ContactController");
}]);