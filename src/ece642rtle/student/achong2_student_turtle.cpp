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

#include "student.h"

// Ignore this line until project 5
turtleMove studentTurtleStep(bool bumped) {return MOVE;}

// OK TO MODIFY BELOW THIS LINE
typedef struct Point{
  int x;
  int y;
};
enum Direction{LEFT, RIGHT, FORWARD, BACKWARD};
enum State{STOP,GO,ACT};
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
	static bool mod = true;
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
		//bump checks if the space in front of it is blocked
		bump = bumped(Prev.x,Prev.y,New.x,New.y);
		//aent checks if space is at the end of maze
		atEnd = atend(pos_.x(), pos_.y());
		//State 0 means it stays in place, state 1 means it moves
		if(orientation == LEFT){ //Left
			if(state == action){
				orientation = RIGHT;  state = GO; }
			else if (bump){
				orientation = BACKWARD;  state = STOP; }
			else{
				state = action;}
		}
		else if(orientation == RIGHT){ //Right
			if(state == action){
				orientation = FORWARD;  state = GO; }
			else if (bump){
				orientation = LEFT;  state = STOP; }
			else{
				state = action;}
		}
		else if(orientation == FORWARD){ //Forward
			if(state == action){
				orientation = BACKWARD;  state = GO; }
			else if (bump){
				orientation = RIGHT;  state = STOP; }
			else{
				state = action;}
  		}
  		else if(orientation == BACKWARD){ //Backward
			if(state == action){
				orientation = LEFT;  state = GO; }
			else if (bump){
				orientation = FORWARD;  state = STOP; }
			else{
				state = action;}
		}
		status= (state == action);
			ROS_INFO("Orientation=%f  STATE=%f", orientation, state);
		mod = true;
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
			
			//Orientation here is always 2 - It only needs to go forward
			// if (orientation == LEFT){
			// 	pos_.setX(pos_.x() - 1);
			// 	mapX -= 1;
			// } 
			// if (orientation == RIGHT){
			// 	pos_.setY(pos_.y() - 1); 
			// 	mapY -= 1;
			// } 
			// if (orientation == FORWARD){
			// 	pos_.setX(pos_.x() + 1);
			// 	mapX += 1;
			// }
			// if (orientation == BACKWARD){
			// 	pos_.setY(pos_.y() + 1);
			// 	mapY += 1;
			// }
			map[mapX][mapY] += 1;

		//x is forwards and backwards
		//y is left and right 
		//position is relative to robot heading
		status = false;
		mod = true;
		displayVisits(map[mapX][mapY]);
    }
	}
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
