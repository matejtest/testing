
var home_module = angular.module("home", ["ui.router", "ui.bootstrap"]);

home_module.config(["$stateProvider", function homeConfig($stateProvider) {

	$stateProvider.state("home", {
		url: "/home",
		templateUrl: "home/home.tpl.html",
		controller: "HomeController"
	});

}]);

home_module.controller("HomeController", ["$scope", "HomeService", function HomeController($scope, HomeService) {
	console.log("HomeController");
	$scope.current_user = JSON.parse(sessionStorage.getItem("current_user"));
	$scope.adminRole = $scope.current_user.role == 'admin';


	console.log("$scope.current_user.api_token", $scope.current_user);

	var data =[ {id: 1, name :"All"}, {id: 2, name : "Last Week"},	{id: 3, name : "Last Month"},	{id: 4, name : "Amount > 100"}, {id: 5, name : "Amount < 100"}, {id: 6, name : "Today"}];
	$scope.expenseFilters = data;
	$scope.selectedFilter = $scope.expenseFilters[0];

	// var getFiltersResult = HomeService.getAllFilters($scope.current_user.api_token, $scope.current_user.email)
	// .success(function(response_data, status, response_headers, request){
	// 	$scope.expenseFilters = response_data.filters;
	// }).error(function(response_data, status, response_headers, request){
	// 	console.log("error: ", response_data);
	// });

	console.log("expenseFilters", $scope.expenseFilters);


}]);