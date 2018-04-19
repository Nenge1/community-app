(function (module) {
    mifosX.controllers = _.extend(module, {
        ViewBudgetoryPositionController: function (scope, routeParams, route, location, resourceFactory) {
            resourceFactory.budgetorypositionsResource.getbudgetoryposition({budgetoryPositionId: routeParams.id}, function (data) {
                scope.budgetoryPosition = data;
            })
        }

    });
    mifosX.ng.application.controller('ViewBudgetoryPositionController', ['$scope', '$routeParams', '$route', '$location', 'ResourceFactory', mifosX.controllers.ViewBudgetoryPositionController]).run(function ($log) {
        $log.info("ViewBudgetoryPositionController initialized");
    });
}(mifosX.controllers || {}));