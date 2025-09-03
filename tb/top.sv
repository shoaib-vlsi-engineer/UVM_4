module top;

  //------------------------------------------
  // Import Packages
  //------------------------------------------
  import ram_test_pkg::*;       // Import your testbench classes and sequences
  import uvm_pkg::*;            // Import UVM package
  `include "uvm_macros.svh"     // Include UVM macros for factory registration etc.

  //------------------------------------------
  // Initial Block: Run the test
  //------------------------------------------
  initial begin
    run_test("ram_random_test");   // Start the UVM test called ram_random_test
  end

endmodule : top
