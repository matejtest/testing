


var about_module = angular.module("about", ["ui.router", "ui.bootstrap"]);

about_module.config(function aboutConfig($stateProvider) {

	$stateProvider.state("about", {
		url: "/about",
		controller: "AboutController",
		templateUrl: "about/about.tpl.html",
		data: { pageTitle: " - About"}
	});
});

about_module.controller("AboutController", function AboutController($scope) {
});
