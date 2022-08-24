# Lxnax-s10x instrument for Air Manager
_A implementation of the S10x glider vario suitable for the Got Friends Discus 2c_

## Features implemented :
- Vario speed in a  +/-5 m/s range. Needle in medium size
- Avg wind direction and speed in knots
- Avg vario within a period of 20s
- Altitude in meters

## Release Plan
### 1.x.x _In Planning (Ordered by priority)_
1. Waypoint mode
2. Switching between metric an imperial units
3. Attitude page in waypoint mode
4. Be able to change the number and content of the navboxes
5. Changing avg vario / netto computing time

### 1.1.0 _In development_
- Yellow bar : min/ max vario 
- Speed to fly indicator
- Blue arrow : MacCready setting
- Red diamond : Avg. Netto within a period of 10s
- 4 navboxes : Avg vario, Netto, Altitude and TAS (True Air Speed)
- _Fix : Using TOTAL ENERGY event instead of VARIO NEEDLE to compute the vario_

### 1.0.0 _Released_
- Vario speed in a  +/-5 m/s range. Needle in medium size
- Avg wind direction and speed in knots
- Avg vario within a period of 20s
- Altitude in meters

## Supported platforms
| Simulator | Platforms         |
|:----------|:------------------|
| MSFS 2020 | Windows, Android  |

## Notes
There are two projects in the repos. The first one the Air manager instrument, 
the other one (UI_projects) are the gimp projects of the graphical assets.

## Author
- [Nans Plancher](https://github.com/nan0) / nans.plancher@gmail.com


