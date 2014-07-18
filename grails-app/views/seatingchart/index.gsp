<html>
    <head>

    <title>Simple GSP page</title>
	<r:require modules="jquery-ui"/>
    <r:layoutResources/>   
<style>
#makeMeDraggable { width: 300px; height: 300px; background: red; }
#makeMeDraggable.ui-draggable-dragging { background: green; }
.seat { width: 50px; height: 50px; background:lightgrey; border:2px solid darkgrey }
.student { width: 50px; height: 50px; background:lightblue; border:2px solid darkblue }
#seatPile div.hovered {
  background: #aaa;
}
</style>
    <script type="text/javascript">
console.log("begin");
	var students = new Array();
		
    $( init );

    function init() {
    	$('#successMessage').hide();
    	  $('#successMessage').css( {
    	    left: '580px',
    	    top: '250px',
    	    width: 0,
    	    height: 0
    	  } );
    	  
		//$('#seatPile').html('');
		//$('#studentSlots').html('');

		var numSeats=2;
		
		for(var i=1; i <= numSeats; i++) {
			console.warn("i=" + numSeats);
			$('#seat' + i).droppable( {
				accept: '#studentSlots div',
				hoverClass: 'hovered',
				drop: handleDropEvent
			});

			$('<input>').attr({
				type: 'hidden',
			    id: 'seatingchartseat' + i,
			    name: 'seatingchartseat' + i,
			    value: ''
			}).appendTo('#seatingChartForm');
		}

        //alert("num hidden ele: " + $('#seatingChartForm input:hidden').length);
        // 
	    students[0] = new Array("Sharmeen Ahmed", "123456");
	    students[1] = new Array("Stephany Arzaga", "987654");

	    $('<div id="' + students[0][1] + '" class="student">' + students[0][0] + '</div>').appendTo('#studentSlots').draggable({
			containment:'#content',
			cursor:'move',
			revert:'invalid'
		});
	    
    } //init

    function handleDropEvent( event, ui ) {
    	var draggable = ui.draggable;
    	
    	$( this )
    	.addClass( "ui-state-highlight" )
		.find( "p" )
		.html( "Dropped!" );
      	//alert( 'The square with ID "' + draggable.attr('id') + '" was dropped onto me!' );
      	//alert('my id is' + $(this).attr('id'));
      	//alert('form value: ' + $('#seatingchart.seats(0)').value);
      	
      	
      	// asign studentId to hidden field
      	var seatNum = $(this).attr('id').replace("seat", "");
      	var studentId=draggable.attr('id');
		$('#seatingchartseat' + seatNum).val(studentId);
		//alert("seat "+ seatNum +": " + $('#seatingchartseat' + seatNum).val());
		//console.log("student name:" + getStudentNameFromId(studentId));
		$(this).find("p").html(getStudentNameFromId(studentId));
		
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
    </script>

     </head>
        <body>

<div id="content" style="height: 400px; border: 1px solid black;">
<div id="seatPile" style="border:1px red dashed">
	<div id="seat1" class="ui-widget-header"><p>drop here</p></div>
	<div id="seat2" class="ui-widget-header"><p>drop here</p></div>
</div>
<br/><br/>
<div id="studentSlots"></div>
</div>
<div id="successMessage">
    <h2>You did it!</h2>
    <button onclick="init()">Play Again</button>
  </div>
<form name="seatingChartForm" method="post" id="seatingChartForm">
	<!--  todo: interate of num of seats -->
	<%--<input type="hidden" id="seatingchartseat1" value="wee"/>
	<input type="hidden" id="seatingchartseat2" value="wee"/>
--%></form>    
          <r:layoutResources/>
        </body>
    </html>
    