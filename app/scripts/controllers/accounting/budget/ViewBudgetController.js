(function (module) {
    mifosX.controllers = _.extend(module, {
        ViewBudgetController: function (scope, routeParams, route, location, resourceFactory) {
            resourceFactory.budgetResource.get({budgetId: routeParams.id}, function (data) {
                scope.budget = data;
            })
        }

    });
    mifosX.ng.application.controller('ViewBudgetController', ['$scope', '$routeParams', '$route', '$location', 'ResourceFactory', mifosX.controllers.ViewBudgetController]).run(function ($log) {
        $log.info("ViewBudgetController initialized");
    });
}(mifosX.controllers || {}));