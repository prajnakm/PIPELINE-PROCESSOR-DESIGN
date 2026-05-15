`timescale 1ns / 1ps
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

//The pipeline_processor_tb.v file contains the testbench code used to verify the pipeline processor design.
//The testbench generates the required clock signal for synchronous processor operation.
//The pipeline processor module is instantiated as uut (Unit Under Test).
//The always #5 clk = ~clk statement generates a clock signal that toggles every 5 nanoseconds.
//The initial block initializes the clock signal to 0 at the beginning of simulation.
//The simulation is allowed to run for 100 nanoseconds to observe processor pipeline operation and instruction flow.
//The $finish statement stops the simulation after all operations are completed.
//This testbench helps verify correct instruction fetching, pipeline stage shifting, arithmetic execution, and write back operations using waveform analysis.
