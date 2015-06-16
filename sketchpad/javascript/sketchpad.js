$(document).ready(function() {

	var grid = [];

	var GridDialog = $(function(){

		var dialog, 
			form,
			columns= 30,
			rows=30;
		// create an array from start to end 
		// usage :  row ( 0, 4) will create [0,1,2,3,4] 
		function row (start, end) {
			var arr = [], i = end-start+1;
			while (i--) { arr[i]=  end-- ;}
			return arr ;
		}	
		function verifyInputs(numRows, numCols){
			return true;
		}

		//returns an array of columns. 
		function createGrid (numRows, numCols ){
			numCols = typeof numCols !== 'undefined' ? numCols : 30;
			numRows = typeof numRows !== 'undefined' ? numRows : 30;
			var x = row(0,numCols-1), 
			    y = numRows  , 
			    grid = [];
			while (y--){ grid[y]= x ;}
			console.log(grid);

		}

		dialog = $("#dialog-form").dialog({
			autoOpen:false,
			height: 300,
			width: 350,
			modal: true,
			buttons: {
				"Create a new grid": createGrid(3,6),
				Cancel: function(){
					dialog.dialog("close");
				}
			},
			close: function(){
				form[0].reset();
				allFields.removeClass("ui-state-error");
			}
		});   	

		form = dialog.find("form").on("submit", function(event){
			event.preventDefault();
			createGrid();
		});



	});


		

    $('.navbar').on('mouseenter','li',function(){
    	$(this).css({'background-color' : 'blue'});
    }); 

    $('.navbar').on('mouseleave','li',function(){
    	$(this).css({'background-color' : 'black'});
    }); 

    $('#newGrid').on('click', 'a', function(event){
    	dialog.dialog("open");
    }); 
});



