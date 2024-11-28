class sfifo_sequence extends uvm_sequence#(sfifo_seq_item);
	`uvm_object_utils(sfifo_sequence)
	
	function new(string name = "sfifo_sequence");
		super.new(name);
	endfunction
	
	// Further code here
	virtual task body();
		`uvm_info(get_type_name(), $sformatf("-------- Generata 16 Write REQs --------"), UVM_LOW)
		repeat(16) begin
			req = sfifo_seq_item::type_id::create("req");
			start_item(req);
			assert(req.randomize() with {wr_en == 1; rd_en == 0;});
			finish_item(req);
		end
		
		`uvm_info(get_type_name(), $sformatf("-------- Generate 16 Read REQs --------"), UVM_LOW)
		repeat(16) begin
			req = sfifo_seq_item::type_id::create("req");
			start_item(req);
			assert(req.randomize() with {rd_en == 1; wr_en == 0;});
			finish_item(req);
		end
		
		`uvm_info(get_type_name(), $sformatf("-------- Generata 32 Random REQs --------"), UVM_LOW)
		repeat(100) begin
			req = sfifo_seq_item::type_id::create("req");
			start_item(req);
			assert(req.randomize());
			finish_item(req);
		end
	
	endtask
	
endclass