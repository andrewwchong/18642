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
#include "ros/ros.h"
#endif


// OK TO MODIFY BELOW THIS LINE
static const int32_t sizeX = 11;
static const int32_t sizeY = 11;
static const int32_t mapSize = 23;
static int32_t turtleMap[mapSize][mapSize];
static int32_t mapX = 11;
static int32_t mapY = 11;

static int32_t STATE=S1_CHECK_END;
static int32_t DIRECTION = WEST;

static int32_t min = 1000;
static int32_t minDirection = -1;

// this procedure takes the current turtle position and orientation and returns
// true=submit changes, false=do not submit changes
// Ground rule -- you are only allowed to call the helper functions "bump(..)" and "atend(..)",
// and NO other turtle methods or maze methods (no peeking at the maze!)


void turnRight(){
	switch(DIRECTION){
		case NORTH:{
			DIRECTION = EAST;
			break;
			}
			case EAST:{
			DIRECTION = SOUTH;
			break;
			}
			case SOUTH:{
			DIRECTION = WEST;
			break;
			}
			case WEST:{
			DIRECTION = NORTH;
			break;
			}
			default:{
			ROS_ERROR("undefined direction turn right");
			}
	}
}

turtleMove studentMoveTurtle(bool& bump, bool& atEnd)
{   	
	static int32_t tempX;
	static int32_t tempY;
	static int32_t NUM_TURNS = 0;
	static int32_t TURNS = 0;

	//State 0 means it stays in place, state 1 means it moves
	if(atEnd){
		return NO_MOVE;
	}

	while(true){
		switch(STATE){
			case S1_CHECK_END:{ //S1: Check at End
				//S1
				if(atEnd){
					//2. atEnd = True
					STATE = S5_GOAL;
					break;
				}
				else{
					//1. atEnd = False
					STATE = S2_CHECK_FUNCTION;
					break;
				}
				break;
			}
			case S2_CHECK_FUNCTION:{// S2:Check Functions
				NUM_TURNS = 0;
				minDirection = -1;
				min = 1000;
				STATE = S3_CHECK_DIRECTION;
				break;
			}
			case S3_CHECK_DIRECTION:{ //S3:CheckDirection
				//bump
				//4. numTurns == 4
				if(NUM_TURNS >= 4){
					TURNS=0;
					STATE = S4_MOVE;
					break;
				}

				switch(DIRECTION){
					case NORTH:{
						tempX = mapX;
						tempY = mapY-1;
						break;
					}
					case EAST:{
						tempX = mapX+1;
						tempY = mapY;
						break;
					}
					case SOUTH:{
						tempX = mapX;
						tempY = mapY+1;
						break;
					}
					case WEST:{
						tempX = mapX-1;
						tempY = mapY;
						break;
					}
					default:{
						break;
					}
				}		

				if(turtleMap[tempX][tempY] < min && !bump){
					min = turtleMap[tempX][tempY];
					minDirection = NUM_TURNS; //This represents a direction in the enum
				} 
			
				//3. numTurns <4
				NUM_TURNS++;
				turnRight();
				return TURN_RIGHT;
			}
			case 4:{//S4: Move
				//Turn toward the firection first
				//Move towards Direction
				if(minDirection > TURNS){
					TURNS ++;
					turnRight();
					return TURN_RIGHT;
				}
				switch(DIRECTION){
					case WEST:{
						mapX = mapX-1;
						mapY = mapY;
						break;
					}
					case EAST:{
						mapX = mapX+1;
						mapY = mapY;
						break;
					}
					case NORTH:{
						mapX = mapX;
						mapY = mapY-1;
						break;
					}
					case SOUTH:{
						mapX = mapX;
						mapY = mapY+1;
						break;
					}
					default:{
						break;
					}
				}
				//return mindirections
				turtleMap[mapX][mapY]++;
				displayVisits(turtleMap[mapX][mapY]);
				STATE = S1_CHECK_END;
				return MOVE;
			}
			case 5:{//S5:Goal
				return NO_MOVE;
			}
			default:{
				//ERROR
				ROS_ERROR("undefined state");
			} 
		}
	}
}
