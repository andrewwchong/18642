/*
 * 18-642 Unit Testing Example
 * Example code by Milda Zizyte
 */

#include "student_mock.h"
#include <iostream>
 #include <stdint.h>


int32_t MOVING, STATE;


static const int32_t sizeX = 11;
static const int32_t sizeY = 11;
static const int32_t mapSize = 23;
int32_t MAP[sizeX][sizeY];
static int32_t mapX = 11;
static int32_t mapY = 11;



static Direction mock_orientation;
static bool mock_bump;
static bool mock_error = false;
static bool atEnd = false;


void setAtend(bool end) {
  atEnd = end;
}


/* Functions called by dummy_turtle */
void setOrientation(Direction ornt) {
  mock_orientation = ornt;
}

bool will_bump() {
  return mock_bump;
}

/* Functions used to instrument CUnit tests */
Direction test_orientation_result() {
  return mock_orientation;
}

void mock_set_bump(bool bump) {
  mock_bump = bump;
}

/* Dummy ROS_ERROR */
void ROS_ERROR(std::string e) {
  mock_error = true;
  std::cout << e << std::endl;
}


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
        // displayVisits(MAP[mapX][mapY]);
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
        mock_orientation = static_cast<Direction>((orientation+1)%numDirections);
    }
    return mock_orientation;
}