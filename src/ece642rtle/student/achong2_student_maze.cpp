/* 
 * Originally by Philip Koopman (koopman@cmu.edu)
 * and Milda Zizyte (milda@cmu.edu)
 *
 * STUDENT NAME:Andrew Chong
 * ANDREW ID:achong2
 * LAST UPDATE:
 *
 * This file keeps track of where the turtle is in the maze
 * and updates the location when the turtle is moved. It shall not
 * contain the maze solving logic/algorithm.
 *
 * This file is used along with student_turtle.cpp. student_turtle.cpp shall
 * contain the maze solving logic/algorithm and shall not make use of the
 * absolute coordinates or orientation of the turtle.
 *
 * This file shall call studentTurtleStep(..) in student_turtle.cpp to determine
 * the next move the turtle will make, and shall use translatePos(..) and
 * translateOrnt(..) to translate this move into absolute coordinates
 * to display the turtle.
 *
 */

#include "student.h"

int32_t MOVING, STATE;


static const int32_t sizeX = 11;
static const int32_t sizeY = 11;
static const int32_t mapSize = 23;
int32_t MAP[sizeX][sizeY];
static int32_t mapX = 11;
static int32_t mapY = 11;

/*
 * This procedure takes the current turtle position and orientation and returns true=accept changes, false=do not accept changes
 * Ground rule -- you are only allowed to call the three helper functions defined in student.h, and NO other turtle methods or maze methods (no peeking at the maze!)
 * This file interfaces with functions in student_turtle.cpp
 */
bool moveTurtle(QPointF& pos_, int& nw_or)
{
  Point Prev{};
	Point New{};
	// static int32_t action = 2;
	static int32_t TIMEOUT = 40;
	static bool bump;
	ROS_INFO("Turtle update Called  MOVING=%f", MOVING);
	static bool atEnd = false;
	// static bool status;
  //Only take action if status is moving
  if(MOVING== 0){
    //Update positions
	  Prev.x = pos_.x(); Prev.y = pos_.y();
	  New.x = pos_.x(); New.y = pos_.y();
    int orientation = nw_or;
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
		bump = bumped((int)(float)(Prev.x),(int)(float)(Prev.y),(int)(float)(New.x),(int)(float)(New.y));
		//aent checks if space is at the end of maze
		atEnd = atend((int)(float)(pos_.x()), (int)(float)(pos_.y()));
		//State 0 means it stays in place, state 1 means it moves 

    // turtleMove nextMove = studentTurtleStep(bump); // define your own turtleMove enum or structure
    nw_or = translateOrnt(orientation,bump); //Find orientation of turtle
    // status = (STATE == action);
    pos_ = translatePos(pos_,nw_or,atEnd); //Find translation position of turtle

    }

    //Check for timeout sequence
    if (atEnd){
        return false;}
    if (MOVING==0){ 
        MOVING = TIMEOUT;} 
    else{ 
        MOVING-= 1;}
    if (MOVING==TIMEOUT){
        return true;}
    return false;
}

/*
 * Takes a position and a turtleMove and returns a new position
 * based on the move
 */
QPointF translatePos(QPointF pos_ , int  orientation,bool atEnd) {
  //Take a decision if the turtle is taking an action and is not at the end
  if((STATE == action) && atEnd == false) {
        switch(orientation){
          case LEFT:{
            pos_.setX(pos_.x() - 1); //Decrement x position by 1
            mapX -= 1;	
            break;
          }
          case RIGHT:{
            pos_.setY(pos_.y() - 1); //Decrement y position by 1
            mapY -= 1;
            break;
          }
          case FORWARD:{
            pos_.setX(pos_.x() + 1); //Increment x position by 1
            mapX += 1;
            break;
          }
          case BACKWARD:{
            pos_.setY(pos_.y() + 1);//Increment y position by 1
            mapY += 1;
            break;
          }
          default:{
            ROS_ERROR("undefined direction");
          }
        }
      //Update Map
 			MAP[mapX][mapY] += 1;
		  displayVisits(MAP[mapX][mapY]);
      }
  return pos_;
}

/*
 * Takes an orientation and a turtleMove and returns a new orienation
 * based on the move
 */
 //stateFlag = state==orientation
 //bump = bumped
int translateOrnt(int orientation ,int bump) {
 //Case on orientation
  switch(orientation){
    case LEFT:{ //Left
			if(STATE == action){ //Turn right if action is taken
				orientation = RIGHT;  STATE = GO; }
			else if (bump){ //Move backwards if bumped
				orientation = BACKWARD;  STATE = STOP; }
			else{
				STATE = action;}
      break;
		}
		case RIGHT:{//Right
			if(STATE == action){//Turn Forward if action is taken
				orientation = FORWARD;  STATE = GO; }
			else if (bump){
				orientation = LEFT;  STATE = STOP; }
			else{
				STATE = action;}
      break;
		}
		case FORWARD:{ //Forward
			if(STATE == action){//Turn backward if action is taken
				orientation = BACKWARD;  STATE = GO; }
			else if (bump){
				orientation = RIGHT;  STATE = STOP; }
			else{
				STATE = action;}
      break;
  		}
  	 case BACKWARD:{ //Backward
			if(STATE == action){//Turn Left if action is taken
				orientation = LEFT;  STATE = GO; }
			else if (bump){
				orientation = FORWARD;  STATE = STOP; }
			else{
				STATE = action;}
      break;
		}
    default:{
      break;
    }
  }

  return orientation;
}
