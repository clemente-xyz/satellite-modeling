# Multi-satellite location system around the Earth with applications in space monitoring :satellite: :earth_africa:

- Paper: `satellite_modeling_report.pdf` (attached to this repo).

## Introduction

In this work it is developed a satellite location system for spatial monitoring, based on the satellites ability, to generate a global view of the terrestrial landscape. The idea is to generate a contribution in what could be one of the satellite applications for Chile in its development and aerospace independence.

Barely, what the system does is to predict what is the position and instantaneous speed of a satellite, so as to know at what moment it is fit to take a photograph. Now, why is this necessary? For the proper capture of an image, it is necessary to have at least four satellites with a certain range of visibility as compared to the objective, so if you have several satires at a time, you need to know be able to take a photograph (specifically, when four of them are over a certain range of spatial coordinates). The project envisages putting seven satellites in a row simultaneously.

The mathematical model that sustains the project is based on the numerical solution of the differential equations given by Newton's Law of Universal Gravitation, for initial conditions previously specified (positions and velocities in a particular time). To verify that the 3 satellites are in the right positions, they are drawn to a tangent plane to the Earth as an inertial frame of reference. The calculation engine will be the MATLAB software, which in addition to solving the differential equations numerically, simulate the process completely and indicate the positions and speeds of each satellite to make the predictions.

### Prerequisites

- Matlab software.
- Basic knowledge about ordinary differential equations and numeric methods, especially Euler's method.

In addition to being able to run the scripts, the idea is to have knowledge of what is done (read the paper for that).

### Results

Below I attach some results of the work (plots).

## Authors

- [ClementeSerrano](https://github.com/ClementeSerrano)
