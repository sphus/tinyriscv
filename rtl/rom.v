
module rom #(
        parameter DW = 32,
        parameter AW = 32,
        parameter MEM_NUM = 4096
    )
    (
        input   wire            clk   ,
        input   wire 			rstn  ,
        input   wire 			wen   ,
        input   wire [32-1:0]	w_addr,
        input   wire [32-1:0]   w_data,
        input   wire 			ren   ,
        input   wire [32-1:0]	r_addr,
        output  wire [32-1:0]   r_data
    );

    dual_ram #(
                 .DW      	(32    ),
                 .AW      	(32    ),
                 .MEM_NUM 	(4096  ))
             dual_ram_inst(
                 .clk    	(clk     ),
                 .rstn   	(rstn    ),
                 .wen    	(wen     ),
                 .w_addr 	(w_addr  ),
                 .w_data 	(w_data  ),
                 .ren    	(ren     ),
                 .r_addr 	({2'b0,r_addr[31:2]}  ),
                 .r_data 	(r_data  )
             );

endmodule
