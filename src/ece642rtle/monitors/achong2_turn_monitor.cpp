/*
 * Code by Milda Zizyte
 *
 * This monitor checks that the invariant "turtle shall not move more
 * than on square at a time" is not violated.
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

    
  // store last Pose in memory
  last_orientation =o;

  // Update this flag the first time the turtle moves
  if (!moved) {
    moved = true;
  }
}

/*
 * Empty interrupt handlers beyond this point
 */

void tickInterrupt(ros::Time t) {
    //   ROS_INFO("[[%ld ns]] 'Ticks' was sent.", t.toNSec());
}

void visitInterrupt(ros::Time t, int visits) {
//   ROS_INFO("[[%ld ns]] 'Visits' was sent. Data: %d", t.toNSec(), visits);
}

// t is the time of the bump request, not answer
void bumpInterrupt(ros::Time t, int x1, int y1, int x2, int y2, bool bumped) {
//   ROS_INFO("[[%ld ns]] 'Bump request' was sent. Data: x1 = %d, y1 = %d, x2 = %d, y2 = %d, resp = %s", t.toNSec(), x1, y1, x2, y2, bumped ? "true" : "false");
}

// t is the time of the at_end request, not answer
void atEndInterrupt(ros::Time t, int x, int y, bool atEnd) {
//   ROS_INFO("[[%ld ns]] 'At End Request' was sent. Data: x = %d, y = %d, resp = %s", t.toNSec(), x, y, atEnd ? "true" : "false");
}
