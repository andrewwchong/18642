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
	ROS_INFO("Turtle update Called  moving=%f", moving);
	static bool atEnd = false;
	static bool status;
  	if(moving== 0){
	  Prev.x = pos_.x(); Prev.y = pos_.y();
	  New.x = pos_.x(); New.y = pos_.y();
	  if (orientation < FORWARD){ //Left or right
			if (orientation == LEFT){New.y+=1;} //Go up if orientation is left
			else{New.x+=1;} //Go right if orientation Down
		}
		else{ //up or down
			New.x+=1; //Go Up and Right
			New.y+=1; 
		  if (orientation == FORWARD){Prev.x+=1;}  
		  else{Prev.y+=1;} 
		}
		
		//aent checks if space is at the end of maze
		atEnd = atend(pos_.x(), pos_.y());

		//End Conditions
		if (atEnd){
			return false;}
		if (moving==0){ 
			moving = TIMEOUT;} 
		else{ 
			moving-= 1;}
		if (moving==TIMEOUT){
			return true;}

		//bump checks if the space in front of it is blocked

		//State 0 means it stays in place, state 1 means it moves
		// enum Direction{LEFT, RIGHT, FORWARD, BACKWARD};
		int minDirection = -1;
		int min = 1000;
		Point tempCoord{};		
		for(int i = 0; i < 4; i++){
			switch(i){
				//TODO:need to change these
				case 0:{
					tempCoord.x = Prev.x-1;
					tempCoord.y = Prev.y;

				}
				case 1:{
					tempCoord.x = Prev.x;
					tempCoord.y = Prev.y-1;
				}
				case 2:{
					tempCoord.x = Prev.x+1;
					tempCoord.y = Prev.y;
				}
				case 3:{
					tempCoord.x = Prev.x;
					tempCoord.y = Prev.y+1;
				}
			}
			bump = bumped(Prev.x,Prev.y,tempCoord.x,tempCoord.y);
			if(map[mapX][mapY] < min){
				min = map[mapX][mapY];
				minDirection = i; //This represents a direction in the enum
			} 
		}
		state = action;
		status= (state == action);
		orientation = minDirection;

		ROS_INFO("Orientation=%f  STATE=%f", orientation, state);

		if(status== true && atEnd == false) {
			switch(orientation){
				case LEFT:{
					pos_.setX(pos_.x() - 1);
					mapX -= 1;	
					break;
				}
				case RIGHT:{
					pos_.setY(pos_.y() - 1); 
					mapY -= 1;
					break;
				}
				case FORWARD:{
					pos_.setX(pos_.x() + 1);
					mapX += 1;
					break;
				}
				case BACKWARD:{
					pos_.setY(pos_.y() + 1);
					mapY += 1;
					break;
				}
				default:{
					ROS_ERROR("undefined direction");
				}
			}
			map[mapX][mapY] += 1;

		//x is forwards and backwards
		//y is left and right 
		//position is relative to robot heading
		status = false;
		displayVisits(map[mapX][mapY]);
    }
	}

 return false;
}
