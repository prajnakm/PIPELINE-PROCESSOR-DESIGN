`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2026 21:56:30
// Design Name: 
// Module Name: pipeline_processor_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pipeline_processor_tb;

reg clk;

pipeline_processor uut(
    .clk(clk)
);

always #5 clk = ~clk;

initial begin

    clk = 0;

    #100;

    $finish;

end

endmodule
