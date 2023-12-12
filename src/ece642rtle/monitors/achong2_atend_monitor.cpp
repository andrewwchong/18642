/*
 * Code by Milda Zizyte
 *
 * This monitor checks that the invariant Turtle shall only call atEnd(x,y) if it is at a position x,y.
 * (No remotely fishing around the maze to figure out where the goal is for path planning.)
 */

#include "monitor_interface.h"

// Keeps track of the last pose received
// moved is true if at least one pose has been received, false otherwise
static Orientation last_orientation;
static bool moved = false;

// Flag that doesn't print pose updates if the turtle has moved 0 steps
static const bool suppress_double_visits = true;

static int X = -1;
static int Y = -1;
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
  //Update position
  if(!moved) {
    // Update this flag the first time the turtle moves
    moved = true;
  }
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
  if (!moved) {
    // Update this flag the first time the turtle moves
    return;
  }
  else{
    if(!(X == x && Y == y)){
      ROS_WARN("VIOLATION: Atend Called not on current space current:(%d,%d), prev:(%d,%d)",x,y,X,Y);
    }

  }
}
