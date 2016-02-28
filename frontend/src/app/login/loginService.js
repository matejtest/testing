
app.factory("LoginService", ["$http", function($http){

	return {
		login: function(user){

			console.log("user", user);

			var req = {
				method: "POST",
				url: "http://localhost:8080/api/sessions",
				data: user,
				headers : { "Content-Type" : "application/x-www-form-urlencoded" },
				transformRequest: function(user){
					var str = [];
					for (var attr in user){
						str.push(encodeURIComponent(attr) + "=" + encodeURIComponent(user[attr]));
					}
					return str.join("&");
				}
			};

			return $http(req);
		}
	};
}]);