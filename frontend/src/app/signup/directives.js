
var signup_directives_module = angular.module("signup.directives", []);

signup_directives_module.directive("passwordMatch", function passwordMatch(){
	return {
		restrict: "A",
		require: "ngModel",
		link: function(scope, elem, attrs, ngModel) {
			// console.log("scope", scope);
			// console.log("elem", elem);
			// console.log("attrs", attrs);
			// console.log("ngModel", ngModel);

			scope.$watch(attrs.ngModel, function(){
				if (scope.signupForm.password_confirmation.$viewValue === scope.signupForm.password.$viewValue){
					scope.signupForm.password_confirmation.$setValidity("passwordMatch", true);
				}else {
					scope.signupForm.password_confirmation.$setValidity("passwordMatch", false);
				}
			});
		}
	};
});