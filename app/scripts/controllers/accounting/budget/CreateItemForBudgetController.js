(function (module) {
    mifosX.controllers = _.extend(module, {
        CreateItemForBudgetController: function (scope, routeParams, route, location, dateFilter, resourceFactory) {

            scope.first = {};
            scope.budgetorypositions = [];
            scope.glAccounts = []; 
            scope.budgetId = routeParams.budgetId;         
         
            resourceFactory.accountCoaResource.getAllAccountCoas({
                manualEntriesAllowed: true,
                usage: 1,
                disabled: false
            }, function (data) {
                scope.glAccounts = data;
            });

           resourceFactory.budgetorypositionsResource.getAllbudgetorypositions(function (data) {
                scope.budgetorypositions = data;
            });
            scope.submit = function () {
                this.formData.locale = scope.optlang.code;
                var reqDate = dateFilter(scope.formData.startDate, scope.df);
                var endDate = dateFilter(scope.formData.endDate, scope.df);
                this.formData.dateFormat = scope.df;
                this.formData.startDate = reqDate;
                this.formData.endDate = endDate;
                this.formData.budgetId = routeParams.budgetId;
                resourceFactory.budgetItemResource.save( {'budgetId': routeParams.budgetId, 'itemId': routeParams.itemId},
                 this.formData, function (data) {
                    location.path('/budgets/' + routeParams.budgetId + '/items/');

                });
            };
        }
    });
    mifosX.ng.application.controller('CreateItemForBudgetController', ['$scope', '$routeParams', '$route', '$location', 'dateFilter', 'ResourceFactory', mifosX.controllers.CreateItemForBudgetController]).run(function ($log) {
        $log.info("CreateItemForBudgetController initialized");
    });
}(mifosX.controllers || {}));