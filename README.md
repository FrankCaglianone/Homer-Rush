# Homer Rush ![DrRacket](https://img.shields.io/badge/DrRacket-blue)

## Project Description
A Mario Bros inspired video game but using Homer Simpon in Springfield.
This project was developed as part of my Programming Fundamentals 1 course at [USI](https://www.usi.ch/it?_gl=1%2Agbvona%2A_ga%2AMTE2NTUzMjM1Ny4xNzA3NDEwNzE1%2A_ga_89Y0EEKVWP%2AMTcwOTgyOTY3NS41LjEuMTcwOTgyOTc2MC42MC4wLjE1MDQ4MDcwNDg.)

## Project Features



## Requirements
Make sure to first install the IDE at [Racket](https://racket-lang.org/)

## DATA-TYPES:
1) World-state [menu? in-game? start? map time homer end? quit?] -> 1 player
2) Homer(player) [display skin pos jump jstart end-jump?] 
3) Background [scene pos hspeed floors max-time]
4) Timer (counter) [count sec]

Roads and Donuts are parts of the background image (map), for which posns had been taken to have floors on which homer would have walked on.

Dollars, skateboard , Score counter are not data types anymore because of several lagging problems.

Moe's bar and Homer house are parts of the background image (map).

## CONSTANTS
1) Maps [3 maps]
2) Menu
3) Load
4) Victory
5) Loss
6) Timer [word, box]
7) Homer draw [Homer-Simpson.rkt]

## AUXILIAR FUNCTIONS
1) Map generator (can choose between 3 maps) [file HOMER-BROS.rkt]
2) Player movement [file HOMER-BROS.rkt]
3) Timer [file HOMER-BROS.rkt]
4) Visual function [file HOMER-BROS.rkt]

Dollar movement-floating, Dogs movement, Score counter, Opening door: consequently removed because of removed data types.

-- In file [Images.rkt] are contained all images features --

## GROUP MEMBERS:
1- MASUTTI CRISTIANO
2- PERRI RAFFAELE
3- CAGLIANONE FRANCESCO
4- FANTOZZI ANGELO FRANCESCO


## License
[MIT License](LICENSE)
