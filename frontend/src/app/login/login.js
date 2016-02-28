
var login_module = angular.module("login", ["ui.router"]);

login_module.config(["$stateProvider", function loginConfig($stateProvider){

	$stateProvider.state("login", {
		url: "/login",
		controller: "LoginController",
		templateUrl: "login/login.tpl.html",
		data: { pageTitle: " - login"}
	});

	$stateProvider.state("main", {
		url: "/",
		controller: "ApplicationController"
	});

}]);

login_module.controller("LoginController", ["$scope", "$state", "LoginService", function LoginController($scope, $state, LoginService){

	console.log("LoginController");

	$scope.login = function(user){

		if (!$scope.loginForm.$valid){
			alert("Please check your credentials.");
			return;
		}

		var loginResult = LoginService.login(user);

		loginResult.success(function(response_data, status, response_headers, request){
				$scope.$emit("flashMessage", params = { message : "You've successfully logged in.", data : ""} );

				sessionStorage.setItem("loggedIn", true);
				sessionStorage.setItem("current_user", JSON.stringify(response_data.user));

				$state.go("main");
			}).error(function(response_data, status, response_headers, request){
				alert("Error: " + response_data.message);
			});
	};

}]);