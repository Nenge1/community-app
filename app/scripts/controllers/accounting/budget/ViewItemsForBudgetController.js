(function (module) {
    mifosX.controllers = _.extend(module, {
        ViewItemsForBudgetController: function (scope, routeParams, route, resourceFactory, location) {

            scope.items = [];
            scope.hasItems = false;
            var idToNodeMap = {};

                    scope.clickEvent = function (eventName, budgetId) {
                    eventName = eventName || "";
                    switch (eventName) {
                        case "createItem":
                            location.path('/createItem/' + budgetId );
                            break;
                        case "modifybudget":
                            location.path('/editbudget/' + budgetId );
                            break;
                        case "approve":
                            location.path('/budgets/' + budgetId + '/approve');
                            break;
                        case "reject":
                            location.path('/budgets/' + budgetId + '/reject');
                            break;
                        case "close":
                            location.path('/budgets/' + budgetId + '/close');
                            break;
                    }
                };

                  resourceFactory.budgetItemResource.getAllItemsForBudget({budgetId: routeParams.budgetId},function (data) {
                    scope.items = data;
                    if(scope.items.length>0){
                     scope.hasItems = true;
                    }
                   });
      
            resourceFactory.budgetResource.get({budgetId: routeParams.budgetId, template: 'true'}, function (data) {
                scope.itemsForBudget = data;
                
                   if (data.status.value == "Draft") {
                    scope.buttons = { singlebuttons: [
                        {
                            name: "button.createItem",
                            icon: "fa fa-plus",
                            taskPermissionName: 'CREATEITEM_BUDGET'
                        },
                        {
                            name: "button.modifybudget",
                            icon: "fa fa-pincel-square-o",
                            taskPermissionName: 'UPDATE_BUDGET'
                        }
                    ]
                    };

                     scope.buttonss = { singlebuttonss: [
                        {
                            name: "button.approve",
                            icon: "fa fa-check",
                            taskPermissionName: 'APPROVE_BUDGET'
                        },
                        {
                            name: "button.reject",
                            icon: "fa fa-times",
                            taskPermissionName: 'REJECT_BUDGET'
                        }
                    ]
                    };
                }

               

                if (data.status.value == "Approved") {
                    scope.buttons = { singlebuttons: [                     
                        {
                            name: "button.close",
                            icon: "fa fa-flag",
                            taskPermissionName: 'CLOSE_BUDGET'
                        }
                    ]

                    };
                }
            });

           

            scope.routeToEdit = function (id) {
                location.path('/budgets/' + routeParams.budgetId +'/editItem/' + id);
            };
            scope.routeToView = function (id) {
                location.path('/budgets/' + routeParams.budgetId +'/items/' + id);
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
    mifosX.ng.application.controller('ViewItemsForBudgetController', ['$scope', '$routeParams', '$route', 'ResourceFactory', '$location', mifosX.controllers.ViewItemsForBudgetController]).run(function ($log) {
        $log.info("ViewItemsForBudgetController initialized");
    });
}(mifosX.controllers || {}));