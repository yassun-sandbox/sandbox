var app = angular.module("myApp", []);

app.directive("test1", function () {
    return {
        restrict: "E",
        template: "<div>これはテストだよ！</div>"
    }
})


app.directive("enter", function () {
    return {
        restrict: "A",
        link: function (scope, element, attrs) {
            element.bind("mouseenter", function () {
                element.addClass(attrs.enter);
                element.text("あんぎゅらー");
            });
        }
    };
});

app.directive("leave", function () {
    return function (scope, element, attrs) {
        // defaultではrestrictは"A"
        element.bind("mouseleave", function () {
            element.removeClass(attrs.enter);
            element.text("さいきょう");
        });
    };
});

