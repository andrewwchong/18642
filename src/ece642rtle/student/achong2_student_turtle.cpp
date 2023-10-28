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


#include "student.h"

// Ignore this line until project 5
turtleMove studentTurtleStep(bool bumped) {return MOVE;}





// OK TO MODIFY BELOW THIS LINE
//right 0, Left 1, Forward 2, 3 Backward
float moving, state;

static const int16_t sizeX = 11;
static const int16_t sizeY = 11;
static const int16_t mapSize = 23;
int16_t map[sizeX][sizeY];
static int16_t mapX = 11;
static int16_t mapY = 11;

bool inBounds(Point coord){
	return !(coord.x < 0 || coord.y < 0 || coord.x > sizeX || coord.y > sizeY); 
}

//float status;
// this procedure takes the current turtle position and orientation and returns
// true=submit changes, false=do not submit changes
// Ground rule -- you are only allowed to call the helper functions "bump(..)" and "atend(..)",
// and NO other turtle methods or maze methods (no peeking at the maze!)
bool studentMoveTurtle(QPointF& pos_, int& orientation)
{ 
	Point Prev{};
	Point New{};
	static int16_t action = 2;
	static int16_t TIMEOUT = 10;
	static bool bump;
	// ROS_INFO("Turtle update Called  moving=%f", moving);
	static bool atEnd = false;
	static bool status;
  	if(moving == 0){
	  Prev.x = pos_.x(); Prev.y = pos_.y();
		//atend checks if space is at the end of maze
		atEnd = atend(pos_.x(), pos_.y());

		//State 0 means it stays in place, state 1 means it moves
		// enum Direction{LEFT, RIGHT, FORWARD, BACKWARD};
		int minDirection = -1;
		int min = 1000;
		Point tempCoord{};	
		tempCoord.x = Prev.x;
		tempCoord.y = Prev.y;	
		Point minCoord{};
		minCoord.x = Prev.x;
		minCoord.y = Prev.y;
		int tempX = mapX;
		int tempY = mapY;
		int minX = mapX;
		int minY = mapY;
		for(int i = 0; i < 4; i++){
			switch(i){
				//TODO:need to change these
				case 0:{
					tempCoord.x = Prev.x-1;
					tempCoord.y = Prev.y;
					tempX = mapX-1;
					tempY = mapY;
					break;
				}
				case 1:{
					tempCoord.x = Prev.x+1;
					tempCoord.y = Prev.y;
					tempX = mapX+1;
					tempY = mapY;
					break;
				}
				case 2:{
					tempCoord.x = Prev.x;
					tempCoord.y = Prev.y+1;
					tempX = mapX;
					tempY = mapY+1;
					break;
				}
				case 3:{
					tempCoord.x = Prev.x;
					tempCoord.y = Prev.y-1;
					tempX = mapX;
					tempY = mapY-1;
					break;
				}
				default:{
					break;
				}
			}
			ROS_INFO("Considering (%d,%d) with val %d", tempCoord.x, tempCoord.y,map[tempCoord.x][tempCoord.y]);
			//bump checks if the space in front of it is blocked
			bump = bumped(Prev.x,Prev.y,tempCoord.x,tempCoord.y);
			if(map[tempX][tempY] <= min && !bump && inBounds(tempCoord)){
				min = map[tempX][tempY];
				minDirection = i; //This represents a direction in the enum
				minCoord.x = tempCoord.x;
				minCoord.y = tempCoord.y;	
				minX = tempX;
				minY = tempY;
				ROS_INFO("New coord (%d,%d) with val %d", minCoord.x, minCoord.y,min);
			} 
		}
		state = action;
		status= true;
		orientation = minDirection;

		// ROS_INFO("Orientation=%f  STATE=%f", orientation, state);

		if(status== true && atEnd == false) {
			ROS_INFO("Go to (%d,%d)", minCoord.x, minCoord.y);
			pos_.setX(minCoord.x);
			pos_.setY(minCoord.y);

			mapX = minX;
			mapY = minY;

			// switch(orientation){
			// 	case LEFT:{
			// 		pos_.setX(pos_.x() - 1);
			// 		mapX -= 1;	
			// 		break;
			// 	}
			// 	case RIGHT:{
			// 		pos_.setY(pos_.y() - 1); 
			// 		mapY -= 1;
			// 		break;
			// 	}
			// 	case FORWARD:{
			// 		pos_.setX(pos_.x() + 1);
			// 		mapX += 1;
			// 		break;
			// 	}
			// 	case BACKWARD:{
			// 		pos_.setY(pos_.y() + 1);
			// 		mapY += 1;
			// 		break;
			// 	}
			// 	default:{
			// 		ROS_ERROR("undefined direction");
			// 	}
			// }
			map[mapX][mapY] += 1;

		//x is forwards and backwards
		//y is left and right 
		//position is relative to robot heading
		status = false;
		displayVisits(map[mapX][mapY]);
    }
	}
	//End Conditions
	if (atEnd){
		return false;}
	if (moving==0){ 
		moving = TIMEOUT;} 
	else{ 
		moving-= 1;}
	if (moving==TIMEOUT){
		return true;}
 return false;
}
