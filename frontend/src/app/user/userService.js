
app.factory("UserService", ["$http", function($http){

	return {
		getLoggedInUser: function(apiToken, email){

			var req = {
				method: "GET",
				url: "http://localhost:8080/api/users/loggedin_user",
				headers: { "api-token" : apiToken,
								"email" : email
							}
			};

			return $http(req);
		}
	};

}]);