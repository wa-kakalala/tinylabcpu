`timescale 1ns / 1ps

module tb_top_cpu();

reg         clk       ;
reg         rst       ;

top_cpu tob_cpu(
  .clk    (clk),
  .rst    (rst)
);

initial begin
    clk = 1'b0;
    rst = 1'b0;
end

initial begin
    forever #5 clk = ~clk;
end

initial begin 
    @(posedge clk);
    rst <= 1'b1;
    repeat(10_000) @(posedge clk);
    $stop;
end

endmodule

