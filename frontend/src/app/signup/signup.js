

var signup_module = angular.module("signup", ["ui.router"]);

signup_module.config(["$stateProvider", function signupConfig($stateProvider){

	$stateProvider.state("signup", {
		url: "/signup",
		controller: "SignupController",
		templateUrl: "signup/signup.tpl.html",
		data: { pageTitle: " - signup"}
	});

}]);

signup_module.controller("SignupController", ["$scope", "SignupService", "$state", function SignupController($scope, SignupService, $state){
	console.log("SignupController");

	$scope.signup = function(newUser){
		console.log("signup-user", newUser);

		if ($scope.signupForm.$invalid || newUser === undefined){
			alert("Check your data.");
			return false;
		} else {
			var signupResult = SignupService.register(newUser);

			signupResult.success(function(response_data, status, response_headers, request){
				$scope.$emit("flashMessage", params = { message : "You successfully created your account. Please log in.", data : ""});
				$state.go("login");
			}).error(function(response_data, status, response_headers, request){
				console.log("response_data", response_data);
				console.log("status", status);
				console.log("response_headers", response_headers);
				console.log("request", request);
				alert("Error: " + response_data.message);
			});
		}
	};

}]);