/*
 * 18-642 Unit Testing Example
 * Example code by Milda Zizyte
 */

#include "student_mock.h"
#include <iostream>
#include <stdint.h>


static Direction mock_orientation = NORTH;
static bool mock_bump;
static bool mock_error = false;
static bool atEnd = false;


void setAtend(bool end) {
  atEnd = end;
}

bool get_atEnd(){
  return atEnd;
}

/* Functions called by dummy_turtle */
void setOrientation(Direction ornt) {
  mock_orientation = ornt;
}

bool will_bump() {
  return mock_bump;
}

/* Functions used to instrument CUnit tests */
Direction get_orientation() {
  return mock_orientation;
}

void mock_set_bump(bool bump) {
  mock_bump = bump;
}

bool get_bump(){
  return mock_bump;
}

int mock_translateOrnt(int orientation ,turtleMove move) {
    //Only need to turn right
    if(move == TURN_RIGHT){
         switch(mock_orientation){
          case NORTH:{
              mock_orientation = EAST;
              break;
            }
            case WEST:{
              mock_orientation = NORTH;
              break;
            }
            case SOUTH:{
              mock_orientation = WEST;
              break;
            }
            case EAST:{
              mock_orientation = SOUTH;
              break;
            }
            default:{
              ROS_ERROR("undefined direction translate ornt");
            }
         }
    }
    return mock_orientation;
}

/* Dummy ROS_ERROR */
void ROS_ERROR(std::string e) {
  mock_error = true;
  std::cout << e << std::endl;
}

void displayVisits(int i){
  i++;
}