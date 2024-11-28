package sfifo_agent_pkg;

	`include "uvm_macros.svh"
	import uvm_pkg::*;
	
	// include Agent components (top Agent files)
	`include "sfifo_seq_item.svh"
	`include "sfifo_sequencer.svh"
	`include "sfifo_driver.svh"
	`include "sfifo_monitor.svh"
	
	// include Agent file
	`include "sfifo_agent.svh"
	
endpackage