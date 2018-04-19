(function (module) {
    mifosX.controllers = _.extend(module, {
        EditItemController: function (scope, routeParams, resourceFactory, location, dateFilter) {

            scope.formData = {};
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
            resourceFactory.budgetItemResource.getItem({budgetId: routeParams.budgetId, itemId:routeParams.itemId}, function (data){
                scope.budgetId = data.budgetId;                         

                if (data.endDate) {
                    var editEndDate = dateFilter(data.endDate, scope.df);
                    data.endDate = new Date(editEndDate);
                }
                if (data.startDate) {
                    var editStartDate = dateFilter(data.startDate, scope.df);
                    data.startDate = new Date(editStartDate);
                }
                scope.formData = {
                    description: data.description,
                    endDate: data.endDate,
                    startDate: data.startDate,
                    plannedAmount: data.plannedAmount,
                    glAccountId: data.glAccountId,
                    budgetoryPositionId: data.budgetoryPositionId
                }
            });
            scope.submit = function () {
                this.formData.locale = scope.optlang.code;
                var reqDate = dateFilter(scope.formData.startDate, scope.df);
                var endDate = dateFilter(scope.formData.endDate, scope.df);
                this.formData.dateFormat = scope.df;
                this.formData.startDate = reqDate;
                this.formData.endDate = endDate;
                resourceFactory.budgetItemIdResource.update({'budgetId': routeParams.budgetId,'itemId':routeParams.id}, this.formData, function (data) {
                    location.path('/budgets/' + scope.item.budgetId+'/items');

                });
            };
        }
    });
    mifosX.ng.application.controller('EditItemController', ['$scope', '$routeParams', 'ResourceFactory', '$location', 'dateFilter', mifosX.controllers.EditItemController]).run(function ($log) {
        $log.info("EditItemController initialized");
    });
     
}(mifosX.controllers || {}));