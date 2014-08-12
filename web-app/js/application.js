console.log("wee");

if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

function handleDropEvent( event, ui ) {
	var draggable = ui.draggable;
	
	$( this )
	.addClass( "ui-state-highlight" )
	.find( "p" )
	.html( "Dropped!" );
  	//alert( 'The square with ID "' + draggable.attr('id') + '" was dropped onto me!' );
  	//alert('my id is' + $(this).attr('id'));
  	//alert('form value: ' + $('#seatingchart.seats(0)').value);
  	console.log("seat id: "  + $(this).attr('id') )
  	
  	// asign studentId to hidden field
  	var seatNum = $(this).attr('id').replace("studentseat", "");
  	
  	var studentId=draggable.attr('id');
	$('#seatingchartseat' + seatNum).val(studentId);
	
	//alert("seat "+ seatNum +": " + $('#seatingchartseat' + seatNum).val());
	//console.log("student name:" + getStudentNameFromId(studentId));
	
	$(this).find("p").html(getStudentNameFromId(studentId));
			
	addSeatToChart($(this).attr('id'), studentId, seatNum);
			
	draggable.hide();
} //handleDropEvent

function getStudentNameFromId(studentId) {
//		console.log("id: " + studentId);
	//	console.log("students length: " + students.length);
		for(i=0;i<students.length;i++) {
		//	console.log(students[i])
			if(studentId == students[i][1]) {
				console.log("found match, " + students[i][0] + " " + students[i][1]);
				return students[i][0];
			}
		}
    }

function getStudentIdFromName(studentName) {
//	console.log("name: " + studentName);
//	console.log("students length: " + students.length);
	for(i=0;i<students.length;i++) {
	//	console.log(students[i])
		if(studentName == students[i][0]) {
			console.log("found match, " + students[i][0] + " " + students[i][1]);
			return students[i][1];
		}
	}
}

function addSeatToChart( seatName, userId, seatNumber ) {
	$('<input>').attr({
	    type: 'hidden',
	    id: 'seats[0].name',
	    name: 'seats[0].name',
	    value: seatName
	}).appendTo('form');
	
	$('<input>').attr({
	    type: 'hidden',
	    id: 'seats[0].userId',
	    name: 'seats[0].userId',
	    value: userId
	}).appendTo('form');
	
	$('<input>').attr({
	    type: 'hidden',
	    id: 'seats[0].seatNumber',
	    name: 'seats[0].seatNumber',
	    value: seatNumber
	}).appendTo('form');
	
	$('<input>').attr({
	    type: 'hidden',
	    id: 'seats[0].deleted',
	    name: 'seats[0].deleted',
	    value: 'false'
	}).appendTo('form');
}
