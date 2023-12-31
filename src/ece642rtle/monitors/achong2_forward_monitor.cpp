/*
 * Code by Milda Zizyte
 *
 * This monitor checks that the invariant "the turtle shall face the direction it is moving. 
 * In other words, if the turtle moves from square A to square B, and square B is direction DIR (example: east) of square A, 
 * the turtle must have been facing DIR before moving.
 */

#include "monitor_interface.h"

// Keeps track of the last pose received
// moved is true if at least one pose has been received, false otherwise
static Orientation last_orientation;
static bool moved = false;
static int X = -1;
static int Y = -1;
// Flag that doesn't print pose updates if the turtle has moved 0 steps
static const bool suppress_double_visits = true;

/*
 * Returns absolute value of x
 * WARNING: unsafe for edge-case values
 */
inline int abs(int x) {
  return x < 0 ? -1*x : x;
}

/*
 * Whenever the turtle moves, compare the current location
 * to the previous location and throw an invariant violation
 * if the locations differ by more than 1 in Manhattan Distance.
 */
void poseInterrupt(ros::Time t, int x, int y, Orientation o) {
  // Print pose info
  // Last conditional makes sure that if suppress_double_visits is
  // true, that the same pose isn't printed twice
  int newX,newY;
  //if moved

  
  // Update this flag the first time the turtle moves
  if (!moved) {
    moved = true;
  }
  else{
    if(!(X == x && Y == y)){
      switch(last_orientation){
        case NORTH:{
            newX = X;
            newY = Y-1;
            break;
        }
        case WEST:{
            newX = X-1;
            newY = Y;
            break;
        }
        case SOUTH:{
            newX = X;
            newY = Y+1;
            break;
        }
        case EAST:{
            newX = X+1;
            newY = Y;
            break;
        }
      }
      if(!(newX == x && newY == y)){
          ROS_WARN("VIOLATION: Did not move forward in facing direction. Should be (%d,%d), instead: (%d,%d)",newX,newY,x,y);
        }
    }
  }


    
  // store last Pose in memory
  last_orientation =o;
  X = x;
  Y = y;

}

/*
 * Empty interrupt handlers beyond this point
 */

void tickInterrupt(ros::Time t) {
}

void visitInterrupt(ros::Time t, int visits) {
}

void bumpInterrupt(ros::Time t, int x1, int y1, int x2, int y2, bool bumped) {
}

void atEndInterrupt(ros::Time t, int x, int y, bool atEnd) {
}
