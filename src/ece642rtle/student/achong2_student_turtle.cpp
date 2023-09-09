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

enum Direction{LEFT, RIGHT, FORWARD, BACKWARD};
enum State{STOP,GO};
//right 0, Left 1, Forward 2, 3 Backward
#define TIMEOUT 10    // bigger number slows down simulation so you can see what's happening
float w, state;
float fx1, fy1, fx2, fy2;
float z, aend, mod, bp, q;
		 
// this procedure takes the current turtle position and orientation and returns
// true=submit changes, false=do not submit changes
// Ground rule -- you are only allowed to call the helper functions "bumped(..)" and "atend(..)",
// and NO other turtle methods or maze methods (no peeking at the maze!)
bool studentMoveTurtle(QPointF& pos_, int& orientation)
{ 
	ROS_INFO("Turtle update Called  w=%f", w);
	mod = true;
  if(w == 0){
	  fx1 = pos_.x(); fy1 = pos_.y();
    fx2 = pos_.x(); fy2 = pos_.y();
	  if (orientation < 2){ //Left or right
			if (orientation == LEFT){fy2+=1;} //Go up if orientation is left
			else{fx2+=1;} //Go right if orientation Down
		}
		else{ //up or down
			fx2+=1; //Go Up and Right
			fy2+=1; 
		  if (orientation == FORWARD){fx1+=1;}  
		  else{fy1+=1;} 
		}
		//bp checks if the space in front of it is blocked
		bp = bumped(fx1,fy1,fx2,fy2);
		//aent checks if space is at the end of maze
		aend = atend(pos_.x(), pos_.y());
		//State 0 means it stays in place, state 1 means it moves
		if(orientation == LEFT) //Left
			if(state == 2)  { orientation = RIGHT;  state = GO; }
			else if (bp) { orientation = BACKWARD;  state = STOP; }
			else state = 2;
		else if(orientation == RIGHT) //Right
			if(state == 2)  { orientation = FORWARD;  state = GO; }
			else if (bp) { orientation = LEFT;  state = STOP; }
			else state = 2;
		else if(orientation == FORWARD) //Forward
			if(state == 2)  { orientation = BACKWARD;  state = GO; }
			else if (bp) { orientation = RIGHT;  state = STOP; }
			else state = 2;
		else if(orientation == 3) //Backward
			if(state == 2)  { orientation = LEFT;  state = GO; }
			else if (bp) { orientation = FORWARD;  state = STOP; }
			else state = 2;
    z = (state == 2);
 	 	ROS_INFO("Orientation=%f  STATE=%f,z:%d", orientation, state,z);
    mod = true;
	 if(z == true && aend == false) {
		//Orientation here is always 2 - It only needs to go forward
     if (orientation == LEFT) pos_.setX(pos_.x() - 1);
		 if (orientation == RIGHT) pos_.setY(pos_.y() - 1); 
     if (orientation == FORWARD) pos_.setX(pos_.x() + 1);
     if (orientation == BACKWARD) pos_.setY(pos_.y() + 1);
		//x is forwards and backwards
		//y is left and right 
		//position is relative to robot heading
     z = false;
     mod = true;
    }
	}
    if (aend) return false;
    if (w==0) w  = TIMEOUT; else w -= 1;
    if (w==TIMEOUT) return true;
 return false;
}
