$(document).ready(function() {
    $('#calendar').fullCalendar({
        events: '/events.json',
        selectable: true,
        selectHelper: true,
        select: function(start, end, allDay) {
            console.log('start:' + start);
            console.log('end:' + end);
            console.log('allDay:' + allDay);
            alert('selected');
        }
    });
});
