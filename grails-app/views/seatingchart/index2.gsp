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
    var students = new Array();
    students[0] = new Array("Sharmeen Ahmed", "0573402");
    students[1] = new Array("Stephany Arzaga", "0574254");

    var numOfSeats = 10;
    
    $( init );

    function init() {
    	$('.foo').append( "<div id='draggable' class='ui-widget-content'>jello</div>" );      
      	$('#draggable').draggable();
      	$('#droppable').droppable( {
          	drop: handleDropEvent
        });
    }

    function handleDropEvent( event, ui ) {
    	var draggable = ui.draggable;
    	$( this )
		.addClass( "ui-state-highlight" )
		.find( "p" )
		.html( "Dropped!" );
      	alert( 'The square with ID "' + draggable.attr('id') + '" was dropped onto me!' );
    }

    
	
    </script>
<style>
#draggable { width: 100px; height: 100px; padding: 0.5em; float: left; margin: 10px 10px 10px 0; }
#droppable { width: 150px; height: 150px; padding: 0.5em; float: left; margin: 10px; }
</style>

     </head>
        <body>

<div id="droppable" class="ui-widget-header">
	<p>Drop here</p>
</div>
<div class="foo" style="height:200px;border:1px #333 dashed">
foo
</div>

<form name="seatingChartForm" method="post" id="seatingChartForm">
	// todo: interate of num of seats
	<input type="hidden" name="seatingchart.seats(0)" value=""/>
</form>    
          <r:layoutResources/>
        </body>
    </html>