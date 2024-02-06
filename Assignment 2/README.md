# Data Networks Assignment 2 - Data Link Layer Protocols

The goal of this assignment is to gain hands-on experience simulating data link layer protocols in OMNeT++.

## Overview

The assignment is divided into two parts:

### Part 1 - Stop and Wait Protocol

In this part, I simulated the stop-and-wait protocol by:

- Setting up a basic TicToc network with two nodes passing a packet back and forth
- Transforming it into a stop-and-wait protocol simulation
- Adding frame transmission time delay 
- Computing link utilization based on simulation statistics
- Analyzing how link utilization changes with different parameters

### Part 2 - Visualizing Data Link Activity 

In this part, I gained experience with OMNeT++'s visualization capabilities by:

- Enabling data link visualization in a simple wired network 
- Filtering visualized data link traffic based on specific packets and nodes

## Files

The repository contains the following files:

- `Part1/` - Contains `.ned`, `.cc`, and `.ini` files for the stop-and-wait simulation
- `Part2/` - Contains `.ned`, `.ini` for the data link visualization showcase
- `report.pdf` - Report with explanations, screenshots, and analysis

## Running the Simulations

The simulations can be run by importing the Part1 and Part2 folders into OMNeT++. Detailed instructions are provided in the report.

