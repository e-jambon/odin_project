$(document).ready(function() {

	var grid = [];


	var columns= 30,
		rows=30;


	function cellReSize( numRows, numCols) {
		var cellWidth = 960 / numCols;
		var cellHeight = 960 / numRows;
		return   cellHeight<cellWidth ? cellHeight : cellWidth;
	}

	function drawcell(el){
		el.append("<div class='cell'></div>");
	}

	function drawRow(numCols){
		$("#grid").append('<div class="row">');
		var index = numCols+1;
		while (numCols--) {drawcell($("#grid"));}
	   	$("#grid").append('</div>');
		return true;
	}	


	//returns an array of columns. 
	function createGrid (numRows, numCols ){
		numCols = typeof numCols !== 'undefined' ? numCols : 30;
		numRows = typeof numRows !== 'undefined' ? numRows : 30;
		var cellReSized = cellReSize(numRows, numCols); 
		console.log("cellResised = " + cellReSized);
		while (numRows--){ drawRow(numCols) ;}
		$('.cell')
				.height(cellReSized)
		      	.width(cellReSized);

		$('.cell').on('mouseenter', function(event){
    		$(this).css({'background-color' : 'blue'})
    	});

	}

    $('.navbar').on('mouseenter','li',function(){
    	$(this).css({'background-color' : 'blue'});
    }); 

    $('.navbar').on('mouseleave','li',function(){
    	$(this).css({'background-color' : 'black'});
    }); 

    $('#newGrid').on('click', 'a', function(event){
    	event.preventDefault();
    	$("#grid").empty();
    	var r  = parseInt( $('#rows').val() , 10);
    	var c  = parseInt( $('#columns').val() , 10);
		createGrid(r,c);
    }); 

    $('#clearGrid').on('click','a',function(event){
    	event.preventDefault();
    	$("#grid").empty();
    });

// No error management done here. Pure production disaster, but since I know no 
// unit testing tool yet, I see no point in playing with errors management yet.



});



