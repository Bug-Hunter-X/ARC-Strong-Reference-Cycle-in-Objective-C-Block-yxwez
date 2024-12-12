# Objective-C ARC Strong Reference Cycle in Blocks

This repository demonstrates a common memory management issue in Objective-C using ARC: strong reference cycles within blocks.  The `bug.m` file shows the problematic code, leading to a memory leak. The solution, which uses `__weak`, is provided in `bugSolution.m`.

## Problem
Strong reference cycles can easily occur when a block retains a strong reference to its surrounding object, and that object also retains a strong reference to the block (e.g., via a property).  This creates a circular dependency where neither object can be deallocated, resulting in memory leaks.

## Solution
The solution employs `__weak` to break the retain cycle.  By declaring a weak reference to the object within the block, the block doesn't retain the object, thereby preventing the cycle.