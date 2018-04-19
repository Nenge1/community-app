(function (module) {
    mifosX.controllers = _.extend(module, {
        EditBudgetoryPositionController: function (scope, routeParams, resourceFactory, location, dateFilter) {
             scope.typeStatuses = [ {"id":1, "code":"1", "value":"REVENUE"}, {"id":2, "code":"2", "value":"COST"}];
            resourceFactory.budgetorypositionsResource.getbudgetoryposition({budgetoryPositionId: routeParams.id}, function (data) {
                scope.budgetoryPositionId = data.id;
                
                if (data.status) {
                    if (data.type == 'REVENUE') {
                        data.type = 1;
                    } else {
                        data.type = 2;
                    }
                }
                scope.formData = {
                    name: data.name,
                    description: data.description,
                    type: data.type
                }
            });


            scope.submit = function () {
                this.formData.locale = scope.optlang.code;
                resourceFactory.budgetorypositionsResource.update({'budgetoryPositionId': routeParams.id}, this.formData, function (data) {
                    location.path('/viewBudgetoryPosition/' + data.resourceId);

                });
            };
        }
    });
    mifosX.ng.application.controller('EditBudgetoryPositionController', ['$scope', '$routeParams', 'ResourceFactory', '$location', 'dateFilter', mifosX.controllers.EditBudgetoryPositionController]).run(function ($log) {
        $log.info("EditBudgetoryPositionController initialized");
    });
}(mifosX.controllers || {}));