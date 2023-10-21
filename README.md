# FINAL PROJECT SUBMISSION

## TITLE = HOMER BROS

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

## MEMERS-WORK:
MASUTTI CRISTIANO, PERRI RAFFAELE ->  JUMP SECTOR, HORIZONTAL MOVEMENT, VARIABLE SETTINGS, BIG-BANG OPERATIONS
CAGLIANONE FRANCESCO, FANTOZZI ANGELO FRANCESCO -> RENDERING, WORLD GENERATION, GRAPHICS(images.rkt) 


## License
[MIT License](LICENSE)
