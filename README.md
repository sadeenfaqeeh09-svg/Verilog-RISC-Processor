# 🧠 Verilog RISC Processor Design and Verification

## 📌 Description
This project presents the design and verification of a simple RISC processor implemented in Verilog.

The processor is built using a modular architecture that includes key hardware components such as the datapath, control unit, ALU, register file, instruction memory, and data memory. A complete testbench is used to simulate and verify the functionality of the processor.

The project focuses on RTL design, modular hardware implementation, and simulation-based verification.

---

## 🎯 Objectives
- Design a simple RISC processor using Verilog
- Implement modular hardware components
- Separate datapath and control logic
- Verify processor functionality through simulation
- Test instruction execution using a testbench

---

## ⚙️ Main Components

- **ALU.v**
  - Performs arithmetic and logical operations

- **ControlUnit.v**
  - Generates control signals for processor execution

- **Datapath.v**
  - Connects all processor components and manages data flow

- **InstructionMemory.v**
  - Stores program instructions

- **DataMemory.v**
  - Handles memory read/write operations

- **RegFile.v**
  - Implements processor registers

- **TopModule.v**
  - Integrates all modules into one system

- **Testbench.v**
  - Simulates and verifies processor behavior

---

## 🚀 Features
- Modular Verilog design
- Clear separation between datapath and control unit
- Support for instruction execution flow
- Register file and memory integration
- Simulation using testbench
- Waveform-based verification

---

## ▶️ How to Run

Use any Verilog simulator such as:
- ModelSim
- QuestaSim
- Vivado Simulator

### Example:
* vlog ALU.v ControlUnit.v DataMemory.v Datapath.v InstructionMemory.v RegFile.v TopModule.v Testbench.v
* vsim Testbench
* run -all

--- 

### 📊 Output
- Correct execution of instructions
- Simulation results via testbench
- Waveform verification (signals and timing)

---

### Verilog-RISC-Processor/
*  ALU.v
*  ControlUnit.v
*  DataMemory.v
*  Datapath.v
*  InstructionMemory.v
*  RegFile.v
*  Testbench.v
*  TopModule.v
*  ReportOfProj2.pdf
*  Project-2-Spring-2024-2025.pdf
*  README.md

---

### 📄 Documentation

This repository includes:
📘 Project specification document
📑 Final report with design explanation and results

---

### Environment
Hardware Description Language: Verilog
Simulation Tools: ModelSim / Vivado
OS: Linux / Windows

---

###  Course Information
Course: Computer Architecture
Project: Project 2
Topic: Design and Verification of a Simple RISC Processor




