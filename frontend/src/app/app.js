
var app = angular.module("ExpenseTrackerApp", ["templates-app", "templates-common", "ui.router",
               "about",
               "home",
               "contact",
               "guest",
               "login",
               "signup",
               "signup.directives",
               "forbidden"
            ]);

app.constant("DEV_CONFIG", {
	"BASE_URL" : "http://localhost:8080/"
});

app.constant("PROD_CONFIG", {
	"BASE_URL" : "http://expense-tracker-app.herokuapp.com/"
});

// app.value("loggedIn", {val : false, current_user : false });

app.config(["$stateProvider", "$urlRouterProvider", function myAppConfig ($stateProvider, $urlRouterProvider) {
	$urlRouterProvider.when("main", "index.html");
	$urlRouterProvider.otherwise("/");
}]);

app.run(function run () {
	console.log("Starting app");
});

app.controller("ApplicationController", ["$scope", "$state", function ApplicationController($scope, $state) {

	console.log("ApplicationController");

	$scope.$on('$stateChangeSuccess', function(event, toState, toParams, fromState, fromParams){
		$scope.pageTitle = (toState.data && toState.data.pageTitle) ? ("Expense Tracker App" + toState.data.pageTitle) : "Expense Tracker App";
		$scope.loggedIn = sessionStorage.getItem("loggedIn");

		if (toState.name == "home"){
			if (!$scope.loggedIn){
				$state.go("forbidden");
			}
		}

	});

	$scope.$on("flashMessage", function(event, params){
		$scope.showFlashMessage = true;
		$scope.flashMessage = params.message;
	});

	$scope.closeFlashMessages = function(){
		$scope.showFlashMessage = false;
		$scope.flashMessage = "";
	};

	$scope.loggedIn = sessionStorage.getItem("loggedIn");
	$scope.current_user = JSON.parse(sessionStorage.getItem("current_user"));

	if ($scope.loggedIn) {
		$state.go("home");
	} else {
		$state.go("guest");
	}

}]);