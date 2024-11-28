class sfifo_test extends uvm_test;
	sfifo_sequence sf_seq;
	sfifo_environment sf_env;
	`uvm_component_utils(sfifo_test)
	
	function new(string name = "wrrd_test", uvm_component parent);
		super.new(name, parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		sf_seq = sfifo_sequence::type_id::create("sf_seq", this);
		sf_env = sfifo_environment::type_id::create("sf_env", this);
	endfunction
	
	// Further code here
	virtual task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		#130;
		sf_seq.start(sf_env.sf_agt.sf_seqr);
		phase.drop_objection(this);
		phase.phase_done.set_drain_time(this, 100);
	endtask
	
endclass