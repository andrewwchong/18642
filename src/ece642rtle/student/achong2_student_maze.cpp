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
 * Takes a position and a turtleMove and returns a new position
 * based on the move
 */
QPointF translatePos(QPointF& pos_ ,int orientation,turtleMove nextMove,  bool atEnd) {
  //Take a decision if the turtle is taking an action and is not at the end
  if( nextMove == MOVE && atEnd == false) {
        switch(orientation){
        case NORTH:{
            pos_.setY(pos_.y() + 1);//Increment y position by 1
            mapY += 1;
            break;
          }
          case WEST:{
            pos_.setX(pos_.x() - 1); //Decrement x position by 1
            mapX -= 1;	
            break;
          }
          case SOUTH:{
            pos_.setY(pos_.y() - 1); //Decrement y position by 1
            mapY -= 1;
            break;
          }
          case EAST:{
            pos_.setX(pos_.x() + 1); //Increment x position by 1
            mapX += 1;
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
int translateOrnt(int orientation ,turtleMove move) {
    //Only need to turn left
    if(move == TURN_LEFT){
        orientation = (orientation+1)%numDirections;
    }
    return orientation;
}


/*
 * This procedure takes the current turtle position and orientation and returns true=accept changes, false=do not accept changes
 * Ground rule -- you are only allowed to call the three helper functions defined in student.h, and NO other turtle methods or maze methods (no peeking at the maze!)
 * This file interfaces with functions in student_turtle.cpp
 */
bool moveTurtle(QPointF& pos_, int& orientation)
{
  Point Prev{};
	Point New{};
	static int32_t TIMEOUT = 40;
	static bool bump;
	ROS_INFO("Turtle update Called  MOVING=%d", MOVING);
	static bool atEnd = false;
    //Only take action if status is moving
    if(MOVING == 0){
        //Update positions
        Prev.x = pos_.x(); Prev.y = pos_.y();
        New.x = pos_.x(); New.y = pos_.y();

        switch(orientation){
            case NORTH:{
                New.y += 1; //Increment x position by 1
                break;
            }
            case WEST:{
                New.x -= 1; //Decrement x position by 1
                break;
            }
            case SOUTH:{
                New.y -= 1;//Increment y position by 1
                break;
            }
            case EAST:{
                New.x += 1; //Decrement y position by 1
                break;
            }
          default:{
            ROS_ERROR("undefined direction");
          }
        }
      
        //bump checks if the space in front of it is blocked
        bump = bumped(static_cast<int>(Prev.x),static_cast<int>(Prev.y),static_cast<int>(New.x),static_cast<int>(New.y));

        //atend checks if space is at the end of maze
        atEnd = atend(static_cast<int>(pos_.x()), static_cast<int>(pos_.y()));

        turtleMove nextMove = studentMoveTurtle(bump,atEnd); // define your own turtleMove enum or structure
        orientation = translateOrnt(orientation,nextMove); //Find orientation of turtle
        pos_ = translatePos(pos_,orientation,nextMove,atEnd); //Find translation position of turtle

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

