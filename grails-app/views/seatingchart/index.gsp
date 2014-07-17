<html>
    <head>

    <title>Simple GSP page</title>
	<r:require modules="jquery-ui"/>
    <r:layoutResources/>   
<style>
#makeMeDraggable { width: 300px; height: 300px; background: red; }
#makeMeDraggable.ui-draggable-dragging { background: green; }
</style>
    <script type="text/javascript">

    $( init );

    function init() {
    	$('#successMessage').hide();
    	  $('#successMessage').css( {
    	    left: '580px',
    	    top: '250px',
    	    width: 0,
    	    height: 0
    	  } );
    	  
		$('#seatPile').html('');
		$('#studentSlots').html('');

		var numSeats=10;

		for( var i=0; i < numSeats; i++ ) {
			$('#seat' + i ).data( 'number', i).droppable( {
				containment: '#content',
				stack: '#seatPile div',
				cursor: 'move',
				revert: true
			});	
		} 
    } //init
	
    </script>

     </head>
        <body>

<div id="content" style="height: 400px; border: 1px solid black;">
<div id="seatPile" style="border:1px red dashed"></div>
<div id="studentSlots"></div>
</div>
<div id="successMessage">
    <h2>You did it!</h2>
    <button onclick="init()">Play Again</button>
  </div>
<form name="seatingChartForm" method="post" id="seatingChartForm">
	// todo: interate of num of seats
	<input type="hidden" name="seatingchart.seats(0)" value=""/>
</form>    
          <r:layoutResources/>
        </body>
    </html>