/*
 * Code by Milda Zizyte
 *
 * This monitor checks that the invariant "the turtle can turn a maximum of 90 
 * degrees in a single tick." is not violated
 * It keeps track of the previous position of the turtle and compares it
 * to the current position to check the invariant.
 */

#include "monitor_interface.h"

// Keeps track of the last pose received
// moved is true if at least one pose has been received, false otherwise
static Orientation last_orientation;
static bool moved = false;

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


  if(!moved){
    // Update this flag the first time the turtle moves
    moved = true;
  }
  else{
    switch(o){
          case NORTH:{
              if(last_orientation == SOUTH){
                  ROS_WARN("VIOLATION: Turn more than 90 degrees from %d to %d",last_orientation,o);
              }
              break;
            }
            case WEST:{
              if(last_orientation == EAST){
                  ROS_WARN("VIOLATION: Turn more than 90 degrees from %d to %d",last_orientation,o);
              }
              break;
            }
            case SOUTH:{
              if(last_orientation == NORTH){
                  ROS_WARN("VIOLATION: Turn more than 90 degrees from %d to %d",last_orientation,o);
              }
              break;
            }
            case EAST:{
              if(last_orientation == WEST){
                  ROS_WARN("VIOLATION: Turn more than 90 degrees from %d to %d",last_orientation,o);
              }
              break;
            }
    }
  }
    
  // store last Pose in memory
  last_orientation =o;

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
