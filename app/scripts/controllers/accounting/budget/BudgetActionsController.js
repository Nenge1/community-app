(function (module) {
    mifosX.controllers = _.extend(module, {
        BudgetActionsController: function (scope, resourceFactory, location, routeParams, dateFilter) {

            scope.action = routeParams.action || "";
            scope.budgetId = routeParams.budgetId;
            scope.formData = {};
            scope.restrictDate = new Date();

            switch (scope.action) {  
                case "approve":
                    scope.title = 'label.heading.approvebudget';
                    scope.labelName = 'label.input.savingaccountapprovedOnDate';
                    scope.modelName = 'approvedDate';
                    scope.showDateField = true;
                    scope.taskPermissionName = 'APPROVE_BUDGET';
                    break;

                case "reject":
                    scope.title = 'label.heading.rejectbudget';
                    scope.labelName = 'label.input.rejectedon';
                    scope.modelName = 'rejectedDate';
                    scope.showDateField = true;
                    scope.taskPermissionName = 'REJECT_BUDGET';
                    break;
                case "undoapproval":
                    scope.title = 'label.heading.undoapproveshareaccount';
                    scope.showDateField = false;
                    scope.taskPermissionName = 'UNDOAPPROVAL_BUDGET';
                    break;
                case "close":                   
                    scope.title = 'label.heading.closebudget';
                    scope.labelName = 'label.input.closedon';
                    scope.modelName = 'closedDate';
                    scope.showDateField = true;
                    scope.taskPermissionName = 'CLOSE_BUDGET';
                    break;
            }

            scope.cancel = function () {
                location.path('/budgets/' + routeParams.budgetId + '/items');
            };

            scope.submit = function () {
                var params = {command: scope.action};
                this.formData.locale = scope.optlang.code;
              
                    params.budgetId = scope.budgetId;
                    if (scope.action == "approve") {
                        if (this.formData.approvedDate) {
                            this.formData.approvedDate = dateFilter(this.formData.approvedDate, scope.df);
                            this.formData.dateFormat = scope.df;
                        }
                    } else if (scope.action == "reject") {
                        if (this.formData.rejectedDate) {
                            this.formData.rejectedDate = dateFilter(this.formData.rejectedDate, scope.df);
                            this.formData.dateFormat = scope.df;
                        }
                    } else if (scope.action == "close") {
                        if (this.
                            formData.closedDate) {
                            this.formData.closedDate = dateFilter(this.formData.closedDate, scope.df);
                            this.formData.dateFormat = scope.df;
                         }
                    }
                    resourceFactory.budgetResource.save(params, this.formData, function (data) {
                        location.path('/budgets/' + data.resourceId + '/items');
                    });
            };
        }
    });
    mifosX.ng.application.controller('BudgetActionsController', ['$scope', 'ResourceFactory', '$location', '$routeParams', 'dateFilter', mifosX.controllers.BudgetActionsController]).run(function ($log) {
        $log.info("BudgetActionsController initialized");
    });
}(mifosX.controllers || {}));