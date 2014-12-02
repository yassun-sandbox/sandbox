$(document).ready(function() {

    var select = function(start, end, allDay) {
        var title = window.prompt("title");
        var data = { event: {title: title,
                            start: start,
                            end: end,
                            allDay: allDay}};
        $.ajax({
            type: "POST",
            url: "/events",
            data: data,
            success: function() {
                calendar.fullCalendar('refetchEvents');
            }
        });
        calendar.fullCalendar('unselect');
    };

    var calendar = $('#calendar').fullCalendar({
        events: '/events.json',
        selectable: true,
        selectHelper: true,
        ignoreTimezone: false,
        select: select
    });

});
