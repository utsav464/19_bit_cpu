# ⚡ 19-bit  CPU (Verilog – Vivado)

This project is a Verilog-based implementation of a **single-cycle 19-bit CPU**, designed for **educational purposes**.  
It supports a **custom instruction set architecture (ISA)** with R-type, Load/Store, Branch, Jump, Call, and Return instructions.

---

## ✅ Supported Instruction Set

### 🔹 R-type (Register–Register)
Format: | opcode (5) | rd (3) | rs1 (3) | rs2 (3) | funct (5) | 

**Arithmetic & Logic operations (controlled by `op` field):**

| op     | Meaning | Description            |
|:------:|:--------|:-----------------------|
| 00001  | ADD     | A + B                  |
| 00010  | SUB     | A - B                  |
| 00011  | MUL     | A * B                  |
| 00100  | DIV     | A / B (zero-guarded)   |
| 00101  | INC     | A + 1                  |
| 00110  | DEC     | A - 1                  |
| 00111  | AND     | A & B                  |
| 01000  | OR      | A \| B                 |
| 01001  | XOR     | A ^ B                  |
| 01010  | NOT     | ~A (unary op; B ignored) |


---

### 🔹 Load (I-type)
Format:| opcode (5) | rd (3) | address (11) |
- Loads data from memory into `rd`.

Opcode: `01111`

---

### 🔹 Store (S-type)
Format: | opcode (5) | address (11) | rs1 (3) |
- Stores data from register `rs1` into memory.

Opcode: `10000`

---

### 🔹 Jump
Format: | opcode (5) | address (8) |
- Unconditional jump to address.

Opcode: `01011`

---

### 🔹 Branch Equal (BEQ)
Format:| opcode (5) | rs1 (3) | rs2 (3) | address (8) |
- Branches if `rs1 == rs2`.

Opcode: `01100`

---

### 🔹 Branch Not Equal (BNE)
Format: | opcode (5) | rs1 (3) | rs2 (3) | address (8) |
- Branches if `rs1 != rs2`.

Opcode: `01101`

---

### 🔹 Call
Format: | opcode (5) | address (8) |
- Jumps to subroutine and saves return address.

Opcode: `01110`

---

### 🔹 Return
Format:| opcode (5) | unused (14) |
- Returns to address saved by `call`.

Opcode: `10001`

---


## 📁 Project Structure
```
pipelined_19bit_cpu/
│
├── alu.v # Arithmetic Logic Unit
├── cpu.v # Control & decode logic
├── data_memeory.v # Data memory (RAM)
├── decode_cycle.v # Decode pipeline stage
├── execute_cycle.v # Execute pipeline stage
├── fetch_cycle.v # Fetch pipeline stage
├── instruction_mem.v # Instruction memory (ROM)
├── memory_write_cycle.v # Memory + write-back stage
├── mux2_1.v # 2-to-1 multiplexer
├── mux3_1.v # 3-to-1 multiplexer (PC/jumps)
├── pc_addr.v # PC increment logic
├── pc_module.v # Program Counter register
├── pipeline_top.v # Top-level integration
├── pipeline_tb.v # Testbench for simulation
├── Register_file.v # General-purpose registers
├── sign_extended.v # Immediate/sign-extension unit
├── stack_pointer.v # Stack pointer implementation
├── write_back_cycle.v # Write-back pipeline stage
├── memfile.mem # Sample program (machine code)
└── README.md # Project documentation


---
## 🧪 How to Simulate

1. Open the project in **Xilinx Vivado**.
2. Add all `.v` files to the **Design Sources**.
3. Set `pipeline_tb.v` as the **simulation top module**.
4. Ensure `memfile.mem` is located in the correct directory (next to `instruction_mem.v`).
5. Run the **Behavioral Simulation** and analyze waveforms (PC, pipeline stages, ALU, memory, etc.).

---

## 🧠 Learning Objectives

- Understand the working of a **5-stage pipelined processor** (IF–ID–EX–MEM–WB).
- Learn how datapath components (ALU, Register File, PC, Memory) interact through pipeline registers.
- Study how Verilog modules integrate to form a complete **custom CPU**.
- Gain hands-on experience with simulation and debugging in **Vivado**.

---

## 📌 Tools Used

- **HDL**: Verilog  
- **Simulation**: Xilinx Vivado (XSIM)  
- **Assembler/Encoding**: Manual instruction encoding → `memfile.mem`   

---

## 🚧 Future Improvements

- Add support for control-flow instructions:
  - **CUSTOM INSTRUCTION** (e.g., CUSTOM INSTRUCTION `DEC`, `FET`,`ENC`)   
- Implement **hazard detection** and **data forwarding** for smoother pipelined execution.    
- FPGA synthesis and hardware testing on **Basys 3** or **Nexys A7** boards.  

---

## 🙋 Author

**Utsav Thumar**  
Student of Electronics and Communication Engineering  
[GitHub Profile](https://github.com/utsav464)

---

## 📜 License

This project is **open-source** and free to use for educational purposes.  









