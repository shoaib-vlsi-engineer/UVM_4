//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

// extend ram_wr_agent_config from uvm_object

class ram_wr_agent_config extends uvm_object;


	// UVM Factory Registration Macro
  `uvm_object_utils(ram_wr_agent_config)

	//------------------------------------------
	// Data Members
	//------------------------------------------
	//Declare parameter is_active of type uvm_active_passive_enum and assign it to UVM_ACTIVE
	uvm_active_passive_enum is_active = UVM_ACTIVE;



	//------------------------------------------
	// Methods
	//------------------------------------------
	// Standard UVM Methods:
	extern function new(string name = "ram_wr_agent_config");

endclass: ram_wr_agent_config

//-----------------  constructor new method  -------------------//
function ram_wr_agent_config::new(string name);
  super.new(name); // call the parent class constructor
endfunction: new





