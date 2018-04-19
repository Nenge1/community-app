(function (module) {
    mifosX.controllers = _.extend(module, {
        EditBudgetController: function (scope, routeParams, resourceFactory, location, dateFilter) {
            scope.offices = [];
            resourceFactory.officeResource.getAllOffices(function (data) {
                scope.offices = data;
            });

            resourceFactory.budgetResource.get({budgetId: routeParams.id, template: 'true'}, function (data) {
                scope.budgetId = data.id;
                scope.officeName = data.officeName;
              
                if (data.submittedDate) {
                    var editsubmittedDate = dateFilter(data.submittedDate, scope.df);
                    data.submittedDate = new Date(editsubmittedDate);
                }

                if (data.endDate) {
                    var editEndDate = dateFilter(data.endDate, scope.df);
                    data.endDate = new Date(editEndDate);
                }
                if (data.startDate) {
                    var editStartDate = dateFilter(data.startDate, scope.df);
                    data.startDate = new Date(editStartDate);
                }
                scope.formData = {
                    name: data.name,
                    officeId: data.officeId,
                    description: data.description,
                    status: data.status,
                    endDate: data.endDate,
                    startDate: data.startDate,
                    submittedDate: data.submittedDate
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
                resourceFactory.budgetResource.update({'budgetId': routeParams.id}, this.formData, function (data) {
                    location.path('/viewbudgets/' + data.resourceId);

                });
            };
        }
    });
    mifosX.ng.application.controller('EditBudgetController', ['$scope', '$routeParams', 'ResourceFactory', '$location', 'dateFilter', mifosX.controllers.EditBudgetController]).run(function ($log) {
        $log.info("EditBudgetController initialized");
    });
}(mifosX.controllers || {}));
