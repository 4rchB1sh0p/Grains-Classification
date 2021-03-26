# Two wheeled self balancing robot

A two-wheeled self-balancing robot, PID control architecture. Four PID controllers are implemented to control the position, velocity, rotation and the tilt angle of the robot. 

## Description of 4 Tasks and demonstration
[1. Driving as fast as possible a distance of 3m.](https://youtu.be/GVCfIpjXQpA)

[2. Similar to 1. But additionally a 360° turn at about 1m and 2m travelled.](https://youtu.be/I-p1T8EGFV4)

[3. During balancing an additional weight is added and the robot compensate it (stay/return).](https://youtu.be/bfeMjUOOEl0)

[4. Driving a figure 8 by combining two circles with 1m diameter each.](https://youtu.be/K3pilkZ1mBU)

## Repository Contents
- **code** - Simulink models and codes
- **images** - Images of the robot and the hardware
- **schematics** - Hardware schematic of the robot

## The self balancing two wheeled robot
![](https://github.com/4rchB1sh0p/Two-Wheeled-Robot/blob/main/images/robot_1.JPG)

## Hardware
![](https://github.com/4rchB1sh0p/Two-Wheeled-Robot/blob/main/images/hardware.JPG)

![](https://github.com/4rchB1sh0p/Two-Wheeled-Robot/blob/main/images/hardware_2.JPG)


## Mainboard
![](https://github.com/4rchB1sh0p/Two-Wheeled-Robot/blob/main/images/mainBoard.JPG)


1. Arduino MKR1010 WiFi
2. BLDC motor driver
3. motor connector -> connect to the 3 pin motor driver connector
4. inertial measurement unit (IMU) - MPU 6050
5. 5V DC-DC regulator
6. deep discharge protection IC
7. logic level shifter (3,3V <-> 5V)
8. off/on switch
9. I/O header pins for prototype shield
10. ultra sonic ranger connector
11. line finder connector (left and right)
12. battery main connector
13. battery balance connector
14. charger balance connector
