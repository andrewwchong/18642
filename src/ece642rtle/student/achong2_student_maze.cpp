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
              ROS_INFO("Go North: from %f,%f",pos_.x(),pos_.y());
              pos_.setY(pos_.y() - 1);//Increment y position by 1
              ROS_INFO("To %f,%f",pos_.x(),pos_.y());
              mapY -= 1;
              break;
            }
            case WEST:{
              ROS_INFO("Go west: from %f,%f",pos_.x(),pos_.y());
              pos_.setX(pos_.x() - 1); //Decrement x position by 1
              ROS_INFO("To %f,%f",pos_.x(),pos_.y());
              mapX -= 1;	
              break;
            }
            case SOUTH:{
              ROS_INFO("Go south: from %f,%f",pos_.x(),pos_.y());
              pos_.setY(pos_.y() + 1); //Decrement y position by 1
              ROS_INFO("To %f,%f",pos_.x(),pos_.y());
              mapY += 1;
              break;
            }
            case EAST:{
              ROS_INFO("Go east: from %f,%f",pos_.x(),pos_.y());
              pos_.setX(pos_.x() + 1); //Increment x position by 1
              ROS_INFO("To %f,%f",pos_.x(),pos_.y());
              mapX += 1;
              break;
            }

            default:{
              ROS_ERROR("undefined direction");
            }
        }

      }
  return pos_;
}

/*
 * Takes an orientation and a turtleMove and returns a new orienation
 * based on the move
 */
int translateOrnt(int orientation ,turtleMove move) {
    //Only need to turn right
    if(move == TURN_RIGHT){
        // orientation = (orientation+1)%numDirections;
         switch(orientation){
          case NORTH:{
              orientation = EAST;
              break;
            }
            case WEST:{
              orientation = NORTH;
              break;
            }
            case SOUTH:{
              orientation = WEST;
              break;
            }
            case EAST:{
              orientation = SOUTH;
              break;
            }
            default:{
              ROS_ERROR("undefined direction");
            }
         }
    }
    ROS_INFO("After turn: %d",orientation);
    return orientation;
}


/*
 * This procedure takes the current turtle position and orientation and returns true=accept changes, false=do not accept changes
 * Ground rule -- you are only allowed to call the three helper functions defined in student.h, and NO other turtle methods or maze methods (no peeking at the maze!)
 * This file interfaces with functions in student_turtle.cpp
 */
bool moveTurtle(QPointF& pos_, int& orientation)
{
  Point BumpPoint1{};
	Point BumpPoint2{};
	static int32_t TIMEOUT = 10;
	static bool bump;
	// ROS_INFO("Turtle update Called  MOVING=%d", MOVING);
	static bool atEnd = false;
    //Only take action if status is moving

    if(MOVING == 0){
        ROS_INFO("---------------------------------------------------------------");
        ROS_INFO("Current Pos: %d,%d, Orientation:%d",static_cast<int>(pos_.x()),static_cast<int>(pos_.y()),orientation);
        //Update positions
        // Prev.x = pos_.x(); Prev.y = pos_.y();
        // New.x = pos_.x(); New.y = pos_.y();

        //Update Map
        MAP[mapX][mapY] += 1;
        displayVisits(MAP[mapX][mapY]);

        switch(orientation){
            case NORTH:{
                BumpPoint1.x = pos_.x();
                BumpPoint1.y = pos_.y();                
                BumpPoint2.x = pos_.x()+1;
                BumpPoint2.y = pos_.y();
                break;
            }
            case WEST:{
                BumpPoint1.x = pos_.x();
                BumpPoint1.y = pos_.y();                
                BumpPoint2.x = pos_.x();
                BumpPoint2.y = pos_.y()+1;
                break;
            }
            case SOUTH:{
                BumpPoint1.x = pos_.x();
                BumpPoint1.y = pos_.y()+1;                
                BumpPoint2.x = pos_.x()+1;
                BumpPoint2.y = pos_.y()+1;
                break;
            }
            case EAST:{
                BumpPoint1.x = pos_.x()+1;
                BumpPoint1.y = pos_.y();                
                BumpPoint2.x = pos_.x()+1;
                BumpPoint2.y = pos_.y()+1;
                break;
            }
          default:{
            ROS_ERROR("undefined direction");
          }
        }

        ROS_INFO("Current Pos: %d,%d",static_cast<int>(pos_.x()),static_cast<int>(pos_.y()));

      
        //bump checks if the space in front of it is blocked
        bump = bumped(static_cast<int>(BumpPoint1.x),static_cast<int>(BumpPoint1.y),static_cast<int>(BumpPoint2.x),static_cast<int>(BumpPoint2.y));
				ROS_INFO("Bump of %d,%d and %d,%d is %d",static_cast<int>(BumpPoint1.x),static_cast<int>(BumpPoint1.y),static_cast<int>(BumpPoint2.x),static_cast<int>(BumpPoint2.y),bump);

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

