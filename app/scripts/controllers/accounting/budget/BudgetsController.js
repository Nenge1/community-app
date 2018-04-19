(function (module) {
    mifosX.controllers = _.extend(module, {
        BudgetsController: function (scope, resourceFactory, location) {

            scope.budgets = [];
            var idToNodeMap = {};

            resourceFactory.budgetResource.getAllBudgets(function (data) {
                scope.budgets = data;
            });

            scope.routeTo = function (id) {
                location.path('/viewbudgets/' + id);
            };

            scope.routeToEdit = function (id) {
                location.path('/viewbudgets/' + id);
            };

            scope.routeToItems = function (id) {
                location.path('/budgets/' + id + '/items/');
            };

            scope.deepCopy = function (obj) {
                if (Object.prototype.toString.call(obj) === '[object Array]') {
                    var out = [], i = 0, len = obj.length;
                    for (; i < len; i++) {
                        out[i] = arguments.callee(obj[i]);
                    }
                    return out;
                }
                if (typeof obj === 'object') {
                    var out = {}, i;
                    for (i in obj) {
                        out[i] = arguments.callee(obj[i]);
                    }
                    return out;
                }
                return obj;
            }
        }
    });
    mifosX.ng.application.controller('BudgetsController', ['$scope', 'ResourceFactory', '$location', mifosX.controllers.BudgetsController]).run(function ($log) {
        $log.info("BudgetsController initialized");
    });
}(mifosX.controllers || {}));