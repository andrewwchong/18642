/* 
 * Originally by Philip Koopman (koopman@cmu.edu)
 * and Milda Zizyte (milda@cmu.edu)
 *
 * STUDENT NAME:
 * ANDREW ID:
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

float moving, state;


static const int16_t sizeX = 11;
static const int16_t sizeY = 11;
static const int16_t mapSize = 23;
int16_t map[sizeX][sizeY];
static int16_t mapX = 11;
static int16_t mapY = 11;

/*
 * This procedure takes the current turtle position and orientation and returns true=accept changes, false=do not accept changes
 * Ground rule -- you are only allowed to call the three helper functions defined in student.h, and NO other turtle methods or maze methods (no peeking at the maze!)
 * This file interfaces with functions in student_turtle.cpp
 */
bool moveTurtle(QPointF& pos_, int& nw_or)
{
  Point Prev{};
	Point New{};
	static int16_t action = 2;
	static int16_t TIMEOUT = 40;
	static bool bump;
	ROS_INFO("Turtle update Called  moving=%f", moving);
	static bool mod = true;
	static bool atEnd = false;
	static bool status;
  if(moving== 0){
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
		bump = bumped(Prev.x,Prev.y,New.x,New.y);
		//aent checks if space is at the end of maze
		atEnd = atend(pos_.x(), pos_.y());
		//State 0 means it stays in place, state 1 means it moves

    turtleMove nextMove = studentTurtleStep(bump); // define your own turtleMove enum or structure
    nw_or = translateOrnt(orientation, nextMove,bump);
    status= (state == action);
    pos_ = translatePos(pos_, nextMove,nw_or,atEnd);

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

/*
 * Takes a position and a turtleMove and returns a new position
 * based on the move
 */
QPointF translatePos(QPointF pos_, turtleMove nextMove, Direction  orientation,bool atEnd) {

  if((state == action) && atEnd == false) {
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
		  displayVisits(map[mapX][mapY]);
      }
  return pos_;
}

/*
 * Takes an orientation and a turtleMove and returns a new orienation
 * based on the move
 */
 //stateFlag = state==orientation
 //bump = bumped
int translateOrnt(int orientation, turtleMove nextMove,int bump) {
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
  return orientation;
}
