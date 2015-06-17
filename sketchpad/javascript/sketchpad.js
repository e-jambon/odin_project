$(document).ready(function() {

	var grid = [];


	var dialog, 
		form,
		columns= 30,
		rows=30,
		cellWidth=0,
		cellHeight=0;


	function cellReSize( numRows, numCols) {
		cellWidth = 960 / numCols;
		cellHeight = 960 / numRows;
		return   cellHeight>cellWidth ? cellHeight : cellWidth;
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

	function verifyInputs(numRows, numCols){
		return true;

	}

	//returns an array of columns. 
	function createGrid (numRows, numCols ){
		numCols = typeof numCols !== 'undefined' ? numCols : 30;
		numRows = typeof numRows !== 'undefined' ? numRows : 30;
		var cellReSized = cellReSize(numRows, numCols); 
		console.log("cellResised = " + cellReSized);
		while (numRows--){ drawRow(numCols) ;}
		$('.cell').height(cellReSized)
		$('.cell').width(cellReSized);

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
		createGrid(90,90);
    }); 




});



