// //------------------------------------------
// // CLASS DESCRIPTION
// //------------------------------------------

// // Extend ram_base_test from uvm_test;
// class ram_base_test extends uvm_test;

//    // Factory Registration
// 	`uvm_component_utils(ram_base_test)
  
//     // Declare the ram_env and ram_wr_agent_config handles as ram_envh and m_ram_cfg respectively
//    ram_env            ram_envh;
//    ram_wr_agent_config m_ram_cfg;

// 	//------------------------------------------
// 	// METHODS
// 	//------------------------------------------

// 	// Standard UVM Methods:
// 	extern function new(string name = "ram_base_test" , uvm_component parent);
// 	extern function void build_phase(uvm_phase phase);
	
//  endclass

// //-----------------  constructor new method  -------------------//
// // Define Constructor new() function
// function ram_base_test::new(string name = "ram_base_test", uvm_component parent = null);
//     super.new(name, parent);
// endfunction


// //-----------------  build() phase method  -------------------//
            
// function void ram_base_test::build_phase(uvm_phase phase);
// 	// Create the instance of config_object
//     m_ram_cfg = ram_wr_agent_config::type_id::create("m_ram_cfg");
// 	// set is_active to UVM_ACTIVE 
//     m_ram_cfg.is_active = UVM_ACTIVE;
//     //  the config object into UVM config DB  
// 	uvm_config_db#(ram_wr_agent_config)::set(this, "ram_envh.wr_agnth", "ram_wr_agent_config", m_ram_cfg);
// 	// create the instance for env
//     ram_envh = ram_env::type_id::create("ram_envh", this);
// endfunction

// //------------------------------------------
// // CLASS DESCRIPTION
// //------------------------------------------

// // Extend ram_random_test from ram_base_test;
// class ram_random_test extends ram_base_test;

  
//    // Factory Registration


//    // Declare the handle for  ram_rand_wr_xtns sequence
 
// 	//------------------------------------------
// 	// METHODS
// 	//------------------------------------------

// 	// Standard UVM Methods:
//  	extern function new(string name = "ram_random_test" , uvm_component parent);
// 	extern function void build_phase(uvm_phase phase);
//     extern function void end_of_elaboration_phase(uvm_phase phase);
// 	extern task run_phase(uvm_phase phase);
// endclass

// //-----------------  constructor new method  -------------------//

//  // Define Constructor new() function



// //-----------------  build() phase method  -------------------//
//  // In build phase call build phase of ram_base_test           



// //-----------------  end_of_elobration() phase method  -------------------//
// // print topology             


// //-----------------  run() phase method  -------------------//
// task ram_random_test::run_phase(uvm_phase phase);
// 	//raise objection
   
// 	//create instance for sequence

// 	//start the sequence on write agent sequencer 
  
// 	//drop objection
  
// endtask   






//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

// Extend ram_base_test from uvm_test;
class ram_base_test extends uvm_test;

   // Factory Registration
   `uvm_component_utils(ram_base_test)
  
   // Declare the ram_env and ram_wr_agent_config handles
   ram_env            ram_envh;
   ram_wr_agent_config m_ram_cfg;

	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods (declared as extern for definition outside the class)
	extern function new(string name = "ram_base_test", uvm_component parent = null);
	extern function void build_phase(uvm_phase phase);
	
endclass

//----------------- constructor new method -------------------//
function ram_base_test::new(string name = "ram_base_test", uvm_component parent = null);
    super.new(name, parent);
endfunction

//----------------- build() phase method -------------------//
function void ram_base_test::build_phase(uvm_phase phase);
    // Create the config object
    m_ram_cfg = ram_wr_agent_config::type_id::create("m_ram_cfg");
    // Set the agent to active by default
    m_ram_cfg.is_active = UVM_ACTIVE;
    // Set the config object in the UVM config DB for the environment
    uvm_config_db#(ram_wr_agent_config)::set(this, "ram_envh.wr_agnth", "ram_wr_agent_config", m_ram_cfg);
    // Create the environment instance
    ram_envh = ram_env::type_id::create("ram_envh", this);
endfunction

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

// Extend ram_random_test from ram_base_test;
class ram_random_test extends ram_base_test;

   // Factory Registration
   `uvm_component_utils(ram_random_test)
  
   // Declare the handle for ram_rand_wr_xtns sequence
   ram_rand_wr_xtns seq;

	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods
	extern function new(string name = "ram_random_test", uvm_component parent = null);
	extern function void build_phase(uvm_phase phase);
	extern function void end_of_elaboration_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);

endclass

//----------------- constructor new method -------------------//
function ram_random_test::new(string name = "ram_random_test", uvm_component parent = null);
    super.new(name, parent);
endfunction

//----------------- build() phase method -------------------//
function void ram_random_test::build_phase(uvm_phase phase);
    // Call build_phase of parent (ram_base_test)
    super.build_phase(phase);
    // Additional build tasks for ram_random_test can be added here
endfunction

//----------------- end_of_elaboration() phase method -------------------//
function void ram_random_test::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    // Print the UVM testbench hierarchy for verification
    `uvm_info("TOPOLOGY", $sformatf("Testbench topology: %m"), UVM_LOW)
endfunction

//----------------- run() phase method -------------------//
task ram_random_test::run_phase(uvm_phase phase);
    // Raise objection to prevent simulation from ending
    phase.raise_objection(this);

    // Create an instance of the random write sequence
    seq = ram_rand_wr_xtns::type_id::create("seq");
    
    // Start the sequence on the write agent sequencer
    seq.start(ram_envh.wr_agnth.seqrh);

    // Drop objection after sequence completes
    phase.drop_objection(this);
endtask
