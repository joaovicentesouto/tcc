# Overview

__Context:__ A lightweight operating system approach to emerging lightweight manycores architectures.

__Motivation:__ programmability challenges in lightweight manycores and lack of full-featured operating systems for lightweight manycores.

__Problem:__ Difficulty to port existing systems to these emerging platforms.

__Goal:__ Assist on implementation and study of the new HAL proposed by Pedro H. Penna on MPPA-256.

__Contribution:__ Assist on development of a new approach of Operating Systems to lightweight manycores.

# TCC Structure

* Abstract

* Introduction
    * Goals
        * General Goals
        * Specifics Goals
    * Contributions
    * Organization of the Work

* Theoretical Fundamentation
    * Parallel Architectures
        * Multicores
        * Manycores
            * MPPA-256
                * Hardware
                * Software
    * Nanvix OS
        * Multikernel (Basic overview)
        * Microkernel (Basic overview)
        * HAL

* Related Work
    * Operating Systems for Manycores
    * Search...
    * Search...

* Nanvix HAL implementation on MPPA-256
    * Overview

    * Logical Layers Approach
        * Cluster AL
            * Core Management
            * Memory Management
        * Processor AL
            * Inter-Cluster Communication
            * Debugging and Monitoring

* Prelimiary Experiments
    * Microbenchmarks (syscall, upcall etc).
    * MPPA-256 vs OpTimSoC ?
    * Results

* Schedule

* Conclusions

* References

* Annexes and Appendices