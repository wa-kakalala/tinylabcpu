/**************************************
@ filename    : tb_apb_sram.sv
@ author      : yyrwkk
@ create time : 2025/02/21 22:24:27
@ version     : v1.0.0
**************************************/
module tb_apb_sram ();
parameter N_WIDTH  =  32     ;
parameter N_ADDR   =  10     ;

logic                   pclk   ;
logic                   prstn  ;
logic                   psel   ;
logic                   penable;
logic                   pwrite ;
logic [  N_ADDR-1: 0 ]  paddr  ;
logic [  N_WIDTH-1: 0]  pwdata ;
logic                   pready ;
logic [  N_WIDTH-1: 0]  prdata ;

apb_sram #(
    .N_WIDTH ( N_WIDTH  ) ,
    .N_ADDR  ( N_ADDR   )
)apb_sram_inst(
    .pclk    (pclk   )        ,
    .prstn   (prstn  )        ,
    .psel    (psel   )        ,
    .penable (penable)        ,
    .pwrite  (pwrite )        ,
    .paddr   (paddr  )        ,
    .pwdata  (pwdata )        ,
    .pready  (pready )        , 
    .prdata  (prdata )                   
);

initial begin 
    pclk    = 'b0;
    prstn   = 'b0;
    psel    = 'b0;
    penable = 'b0;
    pwrite  = 'b0;
    paddr   = 'b0;
    pwdata  = 'b0;
end 

initial begin 
    forever #5 pclk = ~pclk;
end


initial begin 
    @(posedge pclk);
    prstn <= 1'b1;
    @(posedge pclk);
    // write 
    psel   <= 1'b1   ;
    paddr  <= 10'd20;
    pwrite <= 1'b1;
    pwdata <= 32'hff;
    @(posedge pclk);
    penable <= 1'b1;
    @(posedge pclk);
    wait( penable & pready) ;
    psel    <= 1'b0   ;
    penable <= 1'b0;
    @(posedge pclk);
    // read 
    psel   <= 1'b1   ;
    paddr  <= 10'd20;
    pwrite <= 1'b0;
    pwdata <= 32'hff;
    @(posedge pclk);
    penable <= 1'b1;
    @(posedge pclk);
    wait( penable & pready) ;
    psel  <= 1'b0   ;
    penable <= 1'b0;

    repeat( 10 ) @(posedge pclk);
    $stop;

end 



endmodule