class sfifo_scoreboard extends uvm_scoreboard;
	`uvm_component_utils(sfifo_scoreboard)
	uvm_analysis_imp#(sfifo_seq_item, sfifo_scoreboard) item_got_export;
	
	function new(string name = "sfifo_scoreboard", uvm_component parent);
		super.new(name, parent);
		// data transaction
		item_got_export = new("item_got_export", this); //
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction
	
	// Further code here
	int queue[$];
	int pass = 0;
	int fail = 0;
	function void write(input sfifo_seq_item item_got);
		bit [7:0] comp_reg;
		if(item_got.wr_en == 1'b1) begin
			queue.push_back(item_got.input_data);
			`uvm_info("Write Data", $sformatf("wr_en: %0b rd_en: %0b input_data: %0h full: %0b",
			item_got.wr_en, item_got.rd_en, item_got.input_data, item_got.full), UVM_LOW);
		end
		
		else if (item_got.rd_en == 1'b1) begin
			if(queue.size() >= 1'd1) begin
				comp_reg = queue.pop_front();
				`uvm_info("Read Data", $sformatf("comp_reg: %0h output_data: %0h empty: %0b",
				comp_reg, item_got.output_data, item_got.empty), UVM_LOW);
				if(comp_reg == item_got.output_data) begin
					$display("-------------- Pass! --------------");
					pass++;
				end
				else begin
					$display("-------------- Fail! --------------");
					$display("----------- Check Empty -----------");
					fail++;
				end
			end
		end
	endfunction

	function void report_phase(uvm_phase phase);
		if(fail == 0) begin
			$display("____________________________________________TEST PASSED__________________________________________");
			$display("*************************************************************************************************");
			uvm_report_info("Scoreboard Report", $sformatf("Transactions PASS = %0d FAIL = %0d", pass, fail), UVM_MEDIUM);
			$display("*************************************************************************************************");
			$display("_________________________________________________________________________________________________");
		end
		else begin
			$display("__________________________________________TEST FAILED___________________________________________");
			$display("************************************************************************************************");
			uvm_report_info("Scoreboard Report", $sformatf("Trasactions PASS = %0d FAIL = %0d", pass, fail), UVM_MEDIUM);
			$display("************************************************************************************************");
			$display("________________________________________________________________________________________________");
		end
	endfunction
	
endclass