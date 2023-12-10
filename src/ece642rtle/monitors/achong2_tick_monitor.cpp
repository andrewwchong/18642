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

static bool poseInt = false;
static bool visitInt = false;
static bool bumpInt = false;
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
  poseInt = true;
}

void tickInterrupt(ros::Time t) {
  if(static_cast<int>(poseInt)+static_cast<int>(visitInt)+static_cast<int>(bumpInt) > 1 ){
    ROS_WARN("VIOLATION: Interrupts called more than once in a tick: Pose:%d,Visit:%d,Bump:%d",poseInt,visitInt,bumpInt);
  }
  poseInt = false;
  visitInt = false;
  bumpInt = false;
}

void visitInterrupt(ros::Time t, int visits) {
  visitInt = true;
}

void bumpInterrupt(ros::Time t, int x1, int y1, int x2, int y2, bool bumped) {
  bumpInt = true;
}

void atEndInterrupt(ros::Time t, int x, int y, bool atEnd) {
}