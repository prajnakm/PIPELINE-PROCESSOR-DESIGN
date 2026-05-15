# PIPELINE-PROCESSOR-DESIGN

COMPANY : CODTECH IT SOLUTIONS

NAME : PRAJNA K M

INTERN ID : CTIS7981

DOMAIN : VLSI

DURATION : 4 MONTHS

MENTOR : NEELA SANTHOSH KUMAR


This repository contains the design and simulation of a simple Pipeline Processor implemented using Verilog HDL. The project was developed to understand the fundamentals of processor architecture, pipelining concepts, synchronous digital circuits, and hardware description language programming. Pipeline processors are widely used in modern CPUs to improve instruction execution speed and overall system performance.

The processor designed in this project demonstrates the basic concept of instruction pipelining using multiple pipeline stages. The design includes pipeline registers representing stages such as Instruction Fetch (IF), Instruction Decode (ID), Execute (EX), and Write Back (WB). Instructions move sequentially from one stage to another during every positive edge of the clock signal.

The processor uses an instruction memory to store sample instructions such as ADD, SUB, and LOAD. A register file is used to store operand values and write back the processed results. The opcode is extracted from instruction bits during the decode stage, and operations are executed using a case statement inside the execute stage.

The project was simulated using Xilinx Vivado, and a separate testbench was written to verify the functionality of the processor pipeline stages. Waveform analysis was used to observe instruction flow, pipeline stage shifting, arithmetic execution, and write back operations.

This repository mainly contains two Verilog files:

1.pipeline_processor.v – Main pipeline processor module

2.pipeline_processor_tb.v – Testbench for simulation and verification


The pipeline processor demonstrates the following operations:

1.Instruction Fetch

2.Instruction Decode

3.Execute Stage

4.Write Back Stage

5.Pipeline Register Transfer


This project helped in understanding important digital design concepts such as:

1.pipeline architecture

2.processor stage execution

3.synchronous sequential circuits

4.Verilog HDL syntax

5.simulation and debugging using waveforms


The design can serve as a beginner-friendly project for students learning FPGA design, Verilog HDL, computer architecture, and processor design concepts. Since pipelining is an important concept used in modern processors, this project also acts as a foundation for advanced CPU and FPGA-based processor systems.

The project was created purely for educational and learning purposes and can be extended further by adding hazard detection, forwarding units, ALU control logic, instruction memory, and advanced processor operations.

OUTPUT:

<img width="1437" height="575" alt="Image" src="https://github.com/user-attachments/assets/11378046-f87e-4cdf-83ac-9f9c100ce0e6" />
