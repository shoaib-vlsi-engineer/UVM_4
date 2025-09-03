//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend ram_env from uvm_env
class ram_env extends uvm_env;

   // Factory Registration
   `uvm_component_utils(ram_env)


	// Declare the ram_wr_agent handle with handle name as wr_agnth
    ram_wr_agent wr_agnth;

	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods:
	extern function new(string name = "ram_env",uvm_component parent);
	extern function void build_phase(uvm_phase phase);


endclass
	
//-----------------  constructor new method  -------------------//
 function ram_env::new(string name = "ram_env", uvm_component parent = null);
   super.new(name, parent);
endfunction

//-----------------  Add UVM build() phase   -------------------//
	//In build phase create the instance of ram_wr_agent
function void ram_env::build_phase(uvm_phase phase);
   super.build_phase(phase);  // Call parent build_phase
    wr_agnth = ram_wr_agent::type_id::create("wr_agnth", this);
endfunction

   
	


   
  
   


