
app.factory("SignupService", ["$http", function($http){

	return {
		register: function(newUser){

			var req = {
				method: "POST",
				url: "http://localhost:8080/api/users",
				data: newUser,
				headers : { "Content-Type" : "application/x-www-form-urlencoded" },
				transformRequest: function(newUser){
					var str = [];
					for (var attr in newUser){
						str.push(encodeURIComponent(attr) + "=" + encodeURIComponent(newUser[attr]));
					}
					return str.join("&");
				}
			};

			return $http(req);
		}
	};
}]);