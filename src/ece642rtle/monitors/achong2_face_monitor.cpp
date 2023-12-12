/*
 * Code by Milda Zizyte
 *
 * This monitor checks that the invariant "for any call to bumped(x1,y1,x2,y2), 
 * the turtle shall be facing the wall segment with endpoints_(x1,y1) and (x2,y2).
 * As a hint, note that this means there is only one valid wall segment that the turtle can call bumped(...) 
 * for any given position and orientation. You might consider computing this valid wall segment and comparing 
 * it to the arguments of bumped(...).
 */

#include "monitor_interface.h"

// Keeps track of the last pose received
// moved is true if at least one pose has been received, false otherwise
static Orientation last_orientation;
static bool moved = false;
static int X = -1;
static int Y = -1;
static int Point1_x = -1;
static int Point1_y = -1;
static int Point2_x = -1;
static int Point2_y = -1;



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
  //Update position
  X = x;
  Y = y;
  last_orientation = o;
}

/*
 * Empty interrupt handlers beyond this point
_*/

void tickInterrupt(ros::Time t) {
}

void visitInterrupt(ros::Time t, int visits) {
}

void bumpInterrupt(ros::Time t, int x1, int y1, int x2, int y2, bool bumped) {
  int newX,newY;


    //This is the wall segment that it should be facing
    switch(last_orientation){
            case NORTH:{
                Point1_x = X;
                Point1_y = Y;                
                Point2_x = X+1;
                Point2_y = Y;
                break;
            }
            case WEST:{
                Point1_x = X;
                Point1_y = Y;                
                Point2_x = X;
                Point2_y = Y+1;
                break;
            }
            case SOUTH:{
                Point1_x = X;
                Point1_y = Y+1;                
                Point2_x = X+1;
                Point2_y = Y+1;
                break;
            }
            case EAST:{
                Point1_x = X+1;
                Point1_y = Y;                
                Point2_x = X+1;
                Point2_y = Y+1;
                break;
            }
          default:{
            ROS_ERROR("undefined direction move turtle");
          }
        }

  //If the x1,y1,x2,y2 don't match th expected value(checks for reversed as well)
  if(!(((x1==Point1_x && y1 == Point1_y) && (x2==Point2_x && y2 == Point2_y)) ||
         ((x1==Point2_x && y1 == Point2_y) && (x2==Point1_x && y2 == Point1_y)))){
    ROS_WARN("VIOLATION: Bump called on incorrect location: Start:(%d,%d) End:(%d,%d)",x1,y1,x2,y2);
    ROS_WARN("VIOLATION: Correct location: Start:(%d,%d) End:(%d,%d)",Point1_x,Point1_y,Point2_x,Point2_y);

  }
}

void atEndInterrupt(ros::Time t, int x, int y, bool atEnd) {
}
