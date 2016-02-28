
app.factory("HomeService", ["$http", function($http){

	return {
		getAllFilters: function(apiToken, email){

			var req = {
				method: "GET",
				url: "http://localhost:8080/api/filters",
				headers : { "api-token" : apiToken, "email" : email }
			};

			return $http(req);
		}
	};
}]);