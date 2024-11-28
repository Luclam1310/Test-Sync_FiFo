virtual class uvm_subscriber #(type T=int) extends uvm_component;
	
	typedef uvm_subscriber #(T) this_type;
	uvm_analysis_imp #(T, this_type) analysis_export;
	
	function new (string name, uvm_component parent);
		super.new(name, parent);
		analysis_export = new("analysis_imp", this);
	endfunction
	
	pure virtual function void write(T t);
endclass

class sfifo_coverage extends uvm_subscriber #(sfifo_seq_item);

	`uvm_component_utils(sfifo_coverage)
	sfifo_seq_item trans; //
	// data transaction
	/*
	// coverage code insertion
	covergroup cov_inst;
	WR_EN:coverpoint trans.wr_en {option.auto_bin_max = 1;}
	RD_EN:coverpoint trans.rd_en {option.auto_bin_max = 1;}
	INPUT_DATA:coverpoint trans.input_data {option.auto_bin_max = 8;}
	FULL:coverpoint trans.full {option.auto_bin_max = 1;}
	EMPTY:coverpoint trans.empty {option.auto_bin_max = 1;}
	OUTPUT_DATA:coverpoint trans.output_data {option.auto_bin_max = 8;}
	endgroup
	*/
	
	covergroup cov_inst;
	WR_EN : coverpoint trans.wr_en {
		bins bwr	= {[0:1]};
	}
	
	RD_EN : coverpoint trans.rd_en {
		bins brd	= {[0:1]};
	}
	
	FULL : coverpoint trans.full {
		bins bf1	= {[0:1]};
	}
	
	EMPTY : coverpoint trans.empty {
		bins bep	= {[0:1]};
	}
	
	INPUT_DATA : coverpoint trans.input_data {
		bins low	= {[0:50]};
		bins med	= {[51:150]};
		bins high	= {[151:255]};
	}
	
	OUTPUT_DATA : coverpoint trans.output_data {
		bins low	= {[0:50]};
		bins med	= {[51:150]};
		bins high	= {[151:255]};
	}
	endgroup
	
	function new(string name = "", uvm_component parent);
		super.new(name, parent);
		// insertion declaration = new();
		cov_inst = new(); //
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction
	
	// Further code here
	virtual function void write(sfifo_seq_item t);
		$cast(trans, t);
		cov_inst.sample();
	endfunction

endclass