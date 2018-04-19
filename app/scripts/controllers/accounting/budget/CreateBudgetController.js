(function (module) {
    mifosX.controllers = _.extend(module, {
        CreateBudgetController: function (scope, resourceFactory, location, dateFilter) {
           scope.offices = [];
           scope.first = {};
            resourceFactory.officeResource.getAllOffices(function (data) {
                scope.offices = data;
                scope.formData = {
                    officeId: scope.offices[0].id
                }
            });

            scope.submit = function () {
                this.formData.locale = scope.optlang.code;
                var reqDate = dateFilter(scope.formData.startDate, scope.df);
                var endDate = dateFilter(scope.formData.endDate, scope.df);
                var submittedDate = dateFilter(scope.formData.submittedDate, scope.df);
                this.formData.dateFormat = scope.df;
                this.formData.startDate = reqDate;
                this.formData.endDate = endDate;
                this.formData.submittedDate = submittedDate;
                resourceFactory.budgetResource.save(this.formData, function (data) {
                    location.path('/viewbudgets/' + data.resourceId);

                });
            };
        }
    });
    mifosX.ng.application.controller('CreateBudgetController', ['$scope', 'ResourceFactory', '$location', 'dateFilter', mifosX.controllers.CreateBudgetController]).run(function ($log) {
        $log.info("CreateBudgetController initialized");
    });
}(mifosX.controllers || {}));