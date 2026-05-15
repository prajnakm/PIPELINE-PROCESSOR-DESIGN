`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2026 21:54:31
// Design Name: 
// Module Name: pipeline_processor
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


module pipeline_processor(
    input clk
);

reg [7:0] instruction_memory [0:3];

reg [7:0] IF_ID;
reg [7:0] ID_EX;
reg [7:0] EX_WB;

reg [7:0] regfile [0:3];

reg [1:0] opcode;
reg [7:0] result;

integer pc;

initial begin

    // Initialize pipeline registers
    IF_ID = 0;
    ID_EX = 0;
    EX_WB = 0;
    opcode = 0;
    result = 0;

    // Initialize PC
    pc = 0;

    // Instructions
    instruction_memory[0] = 8'b00000011; // ADD
    instruction_memory[1] = 8'b01000010; // SUB
    instruction_memory[2] = 8'b10000101; // LOAD

    // Register values
    regfile[0] = 10;
    regfile[1] = 5;
    regfile[2] = 0;
    regfile[3] = 0;

end

always @(posedge clk)
begin

    // FETCH STAGE
    IF_ID <= instruction_memory[pc];

    if(pc < 2)
        pc <= pc + 1;

    // DECODE STAGE
    ID_EX <= IF_ID;
    opcode <= IF_ID[7:6];

    // EXECUTE STAGE
    case(opcode)

        2'b00:
            result <= regfile[0] + regfile[1];

        2'b01:
            result <= regfile[0] - regfile[1];

        2'b10:
            result <= 8'd25;

        default:
            result <= 0;

    endcase

    // WRITEBACK PIPELINE REGISTER
    EX_WB <= result;

    // WRITEBACK
    regfile[2] <= EX_WB;

end

endmodule
