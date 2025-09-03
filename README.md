# UVM_4
UVM_4 — Creating a Write Agent
This work builds a UVM write agent and integrates it into a class-based environment, then runs a random-write sequence to observe driver prints and phase flow in VCS. The driver gets items and prints them; the agent fetches config from the config DB, conditionally creates driver/sequencer when active, and connects their TLM ports; the env creates the agent; the test configures the agent active, builds the env, raises objections, and starts a random sequence on the agent’s sequencer. The package includes all sources and top calls run_test("ram_random_test"); simulation shows 10 transactions printed and completes at 0 ps (no DUT/clock).

# Key Learnings –

Construct a parameterized UVM agent (driver, sequencer, monitor), register with the factory, and wire via seq_item_port/export.

Pass configuration using uvm_config_db (is_active=UVM_ACTIVE) from test into agent scope.

Build env and tests that use objections correctly and run sequences on the agent’s sequencer.

Package sources in a single package and invoke the test via a simple top.

# Files and Roles

write_xtn.sv: transaction with fields, constraints, copy/compare/print, optional post_randomize negative case.

ram_wr_sequencer.sv: uvm_sequencer#(write_xtn).

ram_wr_monitor.sv: run_phase log.

ram_wr_driver.sv: get item, print, item_done.

ram_wr_agent.sv: get config, create monh and when active create/connect drvh and seqrh.

ram_wr_seqs.sv: ram_rand_wr_xtns creates 10 items.

ram_env.sv: creates wr_agnth.

ram_test.sv: config + env build; ram_random_test runs sequence.

ram_test_pkg.sv/top.sv: includes all sources and calls run_test.
