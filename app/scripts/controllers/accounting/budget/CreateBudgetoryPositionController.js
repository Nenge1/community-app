(function (module) {
    mifosX.controllers = _.extend(module, {
        CreateBudgetoryPositionController: function (scope, resourceFactory, location, dateFilter) {
            
            scope.types = [ {"id":1, "code":"1", "value":"REVENUE"}, {"id":2, "code":"2", "value":"COST"}];

            scope.submit = function () {
                this.formData.locale = scope.optlang.code;
                resourceFactory.budgetorypositionsResource.save(this.formData, function (data) {
                    location.path('/budgetorypositions/');

                });
            };
        }
    });
    mifosX.ng.application.controller('CreateBudgetoryPositionController', ['$scope', 'ResourceFactory', '$location', 'dateFilter', mifosX.controllers.CreateBudgetoryPositionController]).run(function ($log) {
        $log.info("CreateBudgetoryPositionController initialized");
    });
}(mifosX.controllers || {}));