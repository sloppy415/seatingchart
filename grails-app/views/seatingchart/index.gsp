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
console.log("wee");
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

		var numSeats=1;
		
		for(var i=1; i <= numSeats; i++) {
			console.warn("i=" + numSeats);
			$('#seat' + i).droppable( {
				accept: '#studentSlots div',
				hoverClass: 'hovered',
				drop: handleDropEvent
			});
		}
        
		var students = new Array();
	    students[0] = new Array("Sharmeen Ahmed", "0573402");
	    students[1] = new Array("Stephany Arzaga", "0574254");
/*
	    for( var i=1; i <= students.length; i++ ) {
			$('<div class="student">' + 'wee' + '</div>').data('number', i).appendTo( '#studentSlots' ).droppable( {
				drop: handleDropEvent
			} );
		}*/
		wee='waa'
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
      	alert( 'The square with ID "' + draggable.attr('id') + '" was dropped onto me!' );
    } //handleDropEvent
    </script>

     </head>
        <body>

<div id="content" style="height: 400px; border: 1px solid black;">
<div id="seatPile" style="border:1px red dashed">
	<div id="seat1" class="seat"><p>drop here</p></div>
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
	<input type="hidden" name="seatingchart.seats(0)" value=""/>
</form>    
          <r:layoutResources/>
        </body>
    </html>