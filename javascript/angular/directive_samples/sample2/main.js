var app = angular.module("myApp", []);

app.directive("test1", function () {
    return {
        controller: function ($scope) {
            $scope.test_array = [];
            this.addHoge = function () {
                $scope.test_array.push("hoge");
            };
            this.addFuga = function () {
                $scope.test_array.push("fuga");
            };
        },
        link: function (scope, element) {
            element.bind("mouseenter", function(){
                console.log(scope.test_array);
            });
        }
    };
});

app.directive("test2", function () {
    return {
        require: "test1",
        link: function (scope, element, attrs, test1Ctrl) {
            test1Ctrl.addHoge();
        }
    };
})

app.directive("test3", function () {
    return {
        require: "test1",
        link: function (scope, element, attrs, test1Ctrl) {
            test1Ctrl.addFuga();
        }
    };
})

