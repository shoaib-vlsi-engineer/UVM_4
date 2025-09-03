//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

// Extend ram_wr_agent from uvm_agent
class ram_wr_agent extends uvm_agent;

   // Factory Registration
   `uvm_component_utils(ram_wr_agent)  
	
   // Declare handle for configuration class ram_wr_agent_config
   ram_wr_agent_config m_cfg;

   // Declare handles for monitor, sequencer, and driver
   ram_wr_monitor   monh;
   ram_wr_sequencer seqrh;
   ram_wr_driver    drvh;

   //------------------------------------------
   // METHODS
   //------------------------------------------

   // Standard UVM Methods declared as extern
   extern function new(string name = "ram_wr_agent", uvm_component parent = null);
   extern function void build_phase(uvm_phase phase);
   extern function void connect_phase(uvm_phase phase);

endclass : ram_wr_agent

//------------------------------------------
// EXTERNAL FUNCTION DEFINITIONS
//------------------------------------------

//----------------- constructor new method -------------------//
function ram_wr_agent::new(string name, uvm_component parent);
   super.new(name, parent);
endfunction    

//----------------- build() phase method -------------------//
function void ram_wr_agent::build_phase(uvm_phase phase);
   // Call parent build phase
   super.build_phase(phase);

   // Get configuration object from UVM config DB
   if(!uvm_config_db#(ram_wr_agent_config)::get(this, "", "ram_wr_agent_config", m_cfg)) begin
      `uvm_fatal("WR_AGENT", "Failed to get ram_wr_agent_config from config DB")
   end

   // Create monitor instance
   monh = ram_wr_monitor::type_id::create("monh", this);

   // If agent is active, create driver and sequencer
   if(m_cfg.is_active == UVM_ACTIVE) begin
      drvh  = ram_wr_driver::type_id::create("drvh", this);
      seqrh = ram_wr_sequencer::type_id::create("seqrh", this);
   end
endfunction      

//----------------- connect() phase method -------------------//
function void ram_wr_agent::connect_phase(uvm_phase phase);
   // If agent is active, connect driver port to sequencer export
   if(m_cfg.is_active == UVM_ACTIVE) begin
      drvh.seq_item_port.connect(seqrh.seq_item_export);
   end
endfunction

