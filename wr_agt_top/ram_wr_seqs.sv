//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

 
// Extend ram_wbase_seq from uvm_sequence parameterized by write_xtn 
class ram_wbase_seq extends uvm_sequence #(write_xtn);  
	
  // Factory registration using `uvm_object_utils
   `uvm_object_utils(ram_wbase_seq)
 
	  
	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods:
    extern function new(string name ="ram_wbase_seq");
	
endclass

//-----------------  constructor new method  -------------------//
 function ram_wbase_seq::new(string name = "ram_wbase_seq");
   super.new(name);
endfunction 

//------------------------------------------------------------------------------
//
// SEQUENCE: Random Write Transactions - Use with write_rand_xtn  
//
//------------------------------------------------------------------------------


//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


//Extend ram_rand_wr_xtns from ram_wbase_seq;
class ram_rand_wr_xtns extends ram_wbase_seq;

  	// Factory registration using `uvm_object_utils
	`uvm_object_utils(ram_rand_wr_xtns)


	//------------------------------------------
	// METHODS
	//------------------------------i------------

	// Standard UVM Methods:
    extern function new(string name ="ram_rand_wr_xtns");
    extern task body();
	
endclass
//-----------------  constructor new method  -------------------//
function ram_rand_wr_xtns::new(string name = "ram_rand_wr_xtns");
   super.new(name);
endfunction

	  
//-----------------  task body method  -------------------//
	//Generate 10 transactions of type write_xtn 
	task ram_rand_wr_xtns::body();
	//create req instance
	write_xtn req;
	repeat (10) begin
        req = write_xtn::type_id::create("req");
 	//start_item(req)
	    start_item(req);
	//assert for randomization
	    assert(req.randomize());
	//finish_item(req)
	    finish_item(req);
		end
endtask



