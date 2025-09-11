# ⚡ 19-bit  CPU (Verilog – Vivado)

This project is a Verilog-based implementation of a **single-cycle 19-bit CPU**, designed for **educational purposes**.  
It supports a **custom instruction set architecture (ISA)** with R-type, Load/Store, Branch, Jump, Call, and Return instructions.

---

## ✅ Supported Instruction Set

### 🔹 R-type (Register–Register)
Format: | opcode (5) | rd (3) | rs1 (3) | rs2 (3) | funct (5) | 
  - Arithmetic & Logic operations (controlled by `funct` field).
  - | op      | Meaning            | Description |
|:-----------:|:------------------:|:-----------|
| `00001`     | ADD                | `A + B` |
| `00010`     | SUB                | `A - B` |
| `00011`     | MUL                | `A * B` |
| `00100`     | DIV                | `A / B` (zero-guarded) |
| `00101`     | INC                | `A + 1` |
| `00110`     | DEC                | `A - 1` |
| `00111`     | AND                | `A & B` |
| `01000`     | OR                 | `A | B` |
| `01001`     | XOR                | `A ^ B` |
| `01010`     | NOT                | `~A` (unary op; B ignored) |

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


19_bit_single_cycle_cpu/
## 📁 Project Structure
├── alu.v               # Arithmetic Logic Unit
├── alu_decoder.v       # ALU control logic
├── control_unit.v      # Main control signals
├── datamem.v           # Data memory
├── imm_gen.v           # Immediate generator
├── instr_mem.v         # Instruction memory
├── muxes.v             # Multiplexers
├── reg_file.v          # Register file (r0–r7)
├── single_cycle_core.v # Top-level processor module
├── single_cycle_tb.v   # Testbench for simulation
├── memfile.hex         # Sample program (machine code)
└── README.md           # Project documentation








