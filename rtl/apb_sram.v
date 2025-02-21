/**************************************
@ filename    : apb_sram.v
@ author      : fangyzh26
@ update by   : yyrwkk
@ create time : 2025/02/21 21:26:19
@ version     : v1.0.0
**************************************/
module apb_sram #(
    parameter N_WIDTH  =  32      ,
    parameter N_ADDR   =  10   
)(
    input                    pclk             ,
    input                    prstn            ,
    input                    psel             ,
    input                    penable          ,
    input                    pwrite           ,
    input  [  N_ADDR-1: 0 ]  paddr            ,
    input  [  N_WIDTH-1: 0]  pwdata           ,

    output                   pready           , 
    output [  N_WIDTH-1: 0]  prdata                      
);

localparam IDLE     = 3'b001; 
localparam SETUP    = 3'b010;
localparam ACCESS   = 3'b100;

reg [2:0] now_state ;
reg [2:0] next_state;

always @ ( posedge pclk or negedge prstn) begin
    if (!prstn) begin
        now_state <= IDLE;
    end else begin
        now_state <= next_state;
    end
end

wire psel_nopenable ;
assign psel_nopenable = psel && !penable;

always @(*) begin
    case (now_state)
    IDLE : begin
        if( psel_nopenable ) begin
            next_state = SETUP;
        end else begin
            next_state = IDLE;
        end
    end
    SETUP : begin
        next_state = ACCESS;
    end
    ACCESS : begin
        if( !psel ) begin
            next_state = IDLE;
        end else if( psel && !penable) begin // maybe some questions 
            next_state = SETUP;
        end else begin
            next_state = ACCESS;
        end
    end
    default : begin
        next_state = IDLE;
    end
    endcase
end

wire                     mem_en      ;
wire                     mem_we      ;
wire  [ N_ADDR-1-2: 0]   apb_addr    ;
wire  [ N_WIDTH-1: 0   ] apb_wdata   ;

assign mem_en    = psel_nopenable;
assign mem_we    = pwrite;
assign apb_addr  = paddr[N_ADDR-1:2];
assign apb_wdata = pwdata;
assign pready    = penable;

sram #(
    .N_WIDTH  (N_WIDTH ) ,
    .N_ADDR   (N_ADDR-2)        
)sram_inst (
    .clk   (pclk       ),
    .rst_n (prstn      ),
    .en    (mem_en     ),
    .we    (mem_we     ),
    .addr  (apb_addr   ),
    .din   (apb_wdata  ),
    .dout  (prdata     ) 
);

endmodule