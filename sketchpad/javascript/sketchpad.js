$(document).ready(function() {

	var grid = [];


	var dialog, 
		form,
		columns= 30,
		rows=30;

	function drawcell(el){
		el.append('<div class="cell" style="width:10px ; height:10px ; bakground-color: black ; display:inline-block;"></div>');
	}


	function verifyInputs(numRows, numCols){
		//yet extremely basic
		return  (numRows instanceof Number ) && ( numCols instanceof Number) ;

	}

	//returns an array of columns. 
	function createGrid (numRows, numCols ){
		(verifyInputs(numRows, numCols) ) || alert("verify your row and col") ;

		numCols = typeof numCols !== 'undefined' ? numCols : 30;
		numRows = typeof numRows !== 'undefined' ? numRows : 30;
		while (numRows--){ drawRow(numCols) ;}
	}

	function drawRow(numCols){
		$("#grid").append('<div class="row">');
		var index = numCols+1;
		while (numCols--) {drawcell($("#grid"));}
	   	$("#grid").append('</div>');
		return true;
	}	

    $('.navbar').on('mouseenter','li',function(){
    	$(this).css({'background-color' : 'blue'});
    }); 

    $('.navbar').on('mouseleave','li',function(){
    	$(this).css({'background-color' : 'black'});
    }); 

    $('#newGrid').on('click', 'a', function(event){
    	$("#grid").empty();
		createGrid(3,6);
    }); 

    createGrid(5,15);



});



