# ALU Design for Single Precision IEEE 754 Floating Point Numbers

This repository contains the design and implementation of an Arithmetic Logic Unit (ALU) that operates on single-precision IEEE 754 floating-point numbers. The design includes operations such as addition, subtraction, multiplication, and division of floating-point numbers.

## Table of Contents
- [Overview](#overview)
- [IEEE 754 Floating Point Standard](#ieee-754-floating-point-standard)
- [Features](#features)
- [Architecture](#architecture)
- [Supported Operations](#supported-operations)
 

## Overview

The Arithmetic Logic Unit (ALU) is designed to handle arithmetic operations on single-precision floating-point numbers based on the IEEE 754 standard. This design is implemented in [HDL/Verilog/VHDL] and can be synthesized on an FPGA for hardware implementation or used in software-based simulations.

## IEEE 754 Floating Point Standard

The IEEE 754 standard for floating-point arithmetic defines a 32-bit representation for floating-point numbers. The format consists of:

- **1-bit Sign**: Determines whether the number is positive or negative.
- **8-bit Exponent**: Encodes the exponent with a bias of 127.
- **23-bit Mantissa**: The fractional part of the number, with an implicit leading 1 for normalized numbers.

The ALU in this project follows this representation to perform accurate floating-point arithmetic.

## Features

- Single-precision floating-point arithmetic as per IEEE 754 standard.
- Support for basic arithmetic operations (add, subtract, multiply, divide).
- Handles edge cases like overflow, underflow, zero, NaN, and infinity.
- Modular design for easy integration into larger systems.
- Simulation scripts and test benches included for verification.

## Architecture

The ALU is designed in a modular fashion, where each operation (addition, subtraction, etc.) is implemented as a separate module. A control unit determines which operation to perform based on input signals.

Key components include:

- **Adder Module**: Implements floating-point addition and subtraction.
- **Multiplier Module**: Handles floating-point multiplication.
- **Divider Module**: Manages floating-point division.
- **Normalization and Rounding**: Ensures that results conform to the IEEE 754 standard.

## Supported Operations

The ALU supports the following operations:

- **Addition**
- **Subtraction**
- **Multiplication**
- **Division**
 
