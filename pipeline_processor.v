`timescale 1ns / 1ps
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

//The pipeline_processor.v file contains the Verilog code for a simple pipelined processor design
//The design uses a clock signal (clk) for synchronous processor operation.
//Instruction memory is used to store sample processor instructions such as ADD, SUB, and LOAD.
//Pipeline registers IF_ID, ID_EX, and EX_WB are used to represent different pipeline stages in the processor.
//IF_ID stores instruction data between Instruction Fetch and Decode stages.
//ID_EX stores instruction data between Decode and Execute stages.
//EX_WB stores processed data before the Write Back stage.
//A register file is used to store register values used during arithmetic operations.
//The opcode register stores the operation type extracted from the instruction bits.
//The result register stores the output generated during the Execute stage.
//The program counter (pc) is used to fetch instructions sequentially from instruction memory.
//The initial block initializes pipeline registers, instruction memory, program counter, and register values before simulation starts.
//The always @(posedge clk) block indicates synchronous pipeline operation controlled by the clock signal.
//During the Fetch stage, instructions are fetched from instruction memory using the program counter value.
//The program counter increments after each instruction fetch operation.
//During the Decode stage, the opcode is extracted from the instruction bits.
//During the Execute stage, arithmetic or data operations are performed based on the opcode value using a case statement.
//ADD operation performs addition between register values.
//SUB operation performs subtraction between register values.
//LOAD operation loads a constant value into the result register.
//The EX_WB pipeline register stores the processed result before write back.
//During the Write Back stage, the result is written into the register file.
//The design demonstrates the basic working principle of a pipelined processor using Verilog HDL.
