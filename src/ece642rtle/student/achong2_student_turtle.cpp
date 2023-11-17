/* 
 * Originally by Philip Koopman (koopman@cmu.edu)
 * and Milda Zizyte (milda@cmu.edu)
 *
 * STUDENT NAME:
 * ANDREW ID:
 * LAST UPDATE:
 *
 * This file is an algorithm to solve the ece642rtle maze
 * using the left-hand rule. The code is intentionaly left obfuscated.
 *
 */


//Run:
// catkin_make in catkin_ws
// T1: roscore
// T2: source devel/setup.bash && rosrun ece642rtle ece642rtle_node
// T3: source devel/setup.bash && rosrun ece642rtle ece642rtle_student



#ifdef testing
#include "student_mock.h"
#endif
#ifndef testing
#include "student.h"
#include <ros/ros.h>
#include <boost/bind.hpp>
#include <ece642rtle/timeInt8.h>
#include <std_msgs/Empty.h>
#include <ece642rtle/RTIbump.h>
#include <ece642rtle/RTIatend.h>
#include <ece642rtle/PoseOrntBundle.h>
#include <ece642rtle/bumpEcho.h>
#include <ece642rtle/aendEcho.h>
#include <QPointF>
#endif


// #include "student.h"


// OK TO MODIFY BELOW THIS LINE
//right 0, Left 1, Forward 2, 3 Backward
static int32_t NUM_TURNS = 0;
static int32_t STATE=1;
static int32_t DIRECTION = NORTH;
static int32_t TURNS = 0;

static const int32_t sizeX = 11;
static const int32_t sizeY = 11;
static const int32_t mapSize = 23;
int32_t map[sizeX][sizeY];
static int32_t mapX = 11;
static int32_t mapY = 11;

bool inBounds(Point coord){
	return !(coord.x < 0 || coord.y < 0 || coord.x >= sizeX || coord.y >= sizeY); 
}

// this procedure takes the current turtle position and orientation and returns
// true=submit changes, false=do not submit changes
// Ground rule -- you are only allowed to call the helper functions "bump(..)" and "atend(..)",
// and NO other turtle methods or maze methods (no peeking at the maze!)


turtleMove studentMoveTurtle(bool& bump, bool& atEnd)
{ 
	// Point Prev{};
  	
	//State 0 means it stays in place, state 1 means it moves
	// enum Direction{LEFT, RIGHT, FORWARD, BACKWARD};
	int minDirection = -1;
	int min = 1000;
	// Point tempCoord{};	
	// tempCoord.x = Prev.x;
	// tempCoord.y = Prev.y;	
	// Point minCoord{};
	// minCoord.x = Prev.x;
	// minCoord.y = Prev.y;
	int tempX = mapX;
	int tempY = mapY;
	// int minX = mapX;
	// int minY = mapY;




	while(true){
		switch(STATE){
			case 1:{ //S1: Check at End
				//S1
				if(atEnd){
					//2. atEnd = True
					STATE = 5;
					break;
				}
				else{
					//1. atEnd = False
					STATE = 2;
					break;
				}
				break;
			}
			case 2:{// S2:Check Functions
				NUM_TURNS = 0;
				minDirection = -1;
				min = 1000;
				STATE = 3;
				break;
			}
			case 3:{ //S3:CheckDirection
				//bump
				switch(DIRECTION){
					//TODO:need to change these
					case WEST:{
						tempX = mapX-1;
						tempY = mapY;
						break;
					}
					case EAST:{
						tempX = mapX+1;
						tempY = mapY;
						break;
					}
					case NORTH:{
						tempX = mapX;
						tempY = mapY+1;
						break;
					}
					case SOUTH:{
						tempX = mapX;
						tempY = mapY-1;
						break;
					}
					default:{
						break;
					}
				}
				

				if(map[tempX][tempY] <= min && !bump){
					min = map[tempX][tempY];
					minDirection = DIRECTION; //This represents a direction in the enum
					// minX = tempX;
					// minY = tempY;
					ROS_INFO("New coord (%d,%d) with val %d", tempX,tempY,min);
				} 

				//4. numTurns == 4
				if(NUM_TURNS == 4){
					TURNS=0;
					STATE = 4;
					break;
				}
				//3. numTurns <4
				NUM_TURNS++;
				DIRECTION = (DIRECTION+1)%numDirections;
				return TURN_LEFT;
			}
			case 4:{//S4: Move
				//Turn toward the firection first
				//Move towards Direction
				if(minDirection > TURNS){
					TURNS ++;
					DIRECTION = (DIRECTION+1)%numDirections;
					return TURN_LEFT;
				}


				tempX = mapX;
				tempY = mapY;

				switch(DIRECTION){
					//TODO:need to change these
					case WEST:{
						tempX = mapX-1;
						tempY = mapY;
						break;
					}
					case EAST:{
						tempX = mapX+1;
						tempY = mapY;
						break;
					}
					case NORTH:{
						tempX = mapX;
						tempY = mapY+1;
						break;
					}
					case SOUTH:{
						tempX = mapX;
						tempY = mapY-1;
						break;
					}
					default:{
						break;
					}
				}


				ROS_INFO("Go to (%d,%d)", mapX,mapY);
				mapX = tempX;
				mapY = tempY;
				
				map[mapX][mapY] += 1;
				displayVisits(map[mapX][mapY]);

				//return mindirections
				return MOVE;
			}
			case 5:{//S5:Goal
				return NO_MOVE;
			}
			default:{
				//ERROR
			} 

	}

	}
}
