/*
 * Code by Milda Zizyte
 *
 * This monitor checks that the invariant "the turtle shall not go through walls"
 * is not violated.
 * It keeps track of the previous position of the turtle and compares it
 * to the current position to check the invariant.
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

static const int numTurn = 4;
static bool bumpCount = 0;
static int pastPos[numTurn][2] = {{-1,-1},{-1,-1},{-1,-1},{-1,-1}};
static bool pastBump[numTurn] = {false,false,false,false};

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


  if(!(X == x && Y == y)){//if position changed
    for(int i = 0; i<4; i++){ //go through each position
      if(x == pastPos[i][0] && y == pastPos[i][1]){
        if(pastBump[i] == false){
          ROS_WARN("VIOLATION: bump was false or not checked when moving to this location");
        }
        break;
      }
    }
  }

  // store last Pose in memory
  last_orientation =o;
  X = x;
  Y = y;
  // Update this flag the first time the turtle moves
  if (!moved) {
    moved = true;
  }
}

/*
 * Empty interrupt handlers beyond this point
 */

void tickInterrupt(ros::Time t) {
}

void visitInterrupt(ros::Time t, int visits) {
}

void bumpInterrupt(ros::Time t, int x1, int y1, int x2, int y2, bool bumped) {
  pastPos[bumpCount][0] = x2;
  pastPos[bumpCount][1] = y2;
  pastBump[bumpCount] = bumped;
  bumpCount = (bumpCount+1)%numTurn;
}

void atEndInterrupt(ros::Time t, int x, int y, bool atEnd) {
}
