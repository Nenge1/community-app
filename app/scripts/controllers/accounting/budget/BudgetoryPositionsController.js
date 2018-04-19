(function (module) {
    mifosX.controllers = _.extend(module, {
        BudgetoryPositionsController: function (scope, resourceFactory, location) {

            scope.budgetorypositions = [];

            resourceFactory.budgetorypositionsResource.getAllbudgetorypositions(function (data) {
                scope.budgetorypositions = data;
            });

            scope.routeTo = function (id) {
                location.path('/viewBudgetoryPosition/' + id);
            };

            scope.routeToEdit = function (id) {
                location.path('/viewBudgetoryPosition/' + id);
            };

            scope.routeToDelete = function(id){
                    resourceFactory.budgetorypositionsResource.delete({
                        budgetId: id},function(data){
                        resourceFactory.budgetResource.getAllBudgets(function (data) {
                            scope.budgets = data;
                        });
                        location.path('/budgetorypositions');
                    });
            };
        }
    });
    mifosX.ng.application.controller('BudgetoryPositionsController', ['$scope', 'ResourceFactory', '$location', mifosX.controllers.BudgetoryPositionsController]).run(function ($log) {
        $log.info("BudgetoryPositionsController initialized");
    });
}(mifosX.controllers || {}));