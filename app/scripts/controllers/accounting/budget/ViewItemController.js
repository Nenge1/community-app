(function (module) {
    mifosX.controllers = _.extend(module, {
        ViewItemController: function (scope, routeParams, route, location, resourceFactory) {
            resourceFactory.budgetItemResource.getItem({budgetId: routeParams.budgetId, itemId:routeParams.itemId}, function (data) {
                scope.item = data;
            });
        }

    });

    mifosX.ng.application.controller('ViewItemController', ['$scope', '$routeParams', '$route', '$location', 'ResourceFactory', mifosX.controllers.ViewItemController]).run(function ($log) {
        $log.info("ViewItemController initialized");
    });
}(mifosX.controllers || {}));