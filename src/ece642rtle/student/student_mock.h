// #include <ros/ros.h>
// #include <boost/bind.hpp>
// #include <ece642rtle/timeInt8.h>
// #include <std_msgs/Empty.h>
// #include <ece642rtle/RTIbump.h>
// #include <ece642rtle/RTIatend.h>
// #include <ece642rtle/PoseOrntBundle.h>
// #include <ece642rtle/bumpEcho.h>
// #include <ece642rtle/aendEcho.h>
#include <stdint.h>
#include <iostream>
// #include <QPointF>

// Functions to interface with ROS. Don't change these lines!
bool bumped(int x1,int y1,int x2,int y2);
bool atend(int x, int y);
void displayVisits(int visits);
// bool moveTurtle(QPointF& pos_, int& nw_or);
enum turtleMove {MOVE, NO_MOVE, TURN_RIGHT};

// Scope-preserving changes to these lines permitted (see p5 writeup)
// QPointF translatePos(QPointF& pos_ , int  orientation,turtleMove nextMove,bool atEnd);
// QPointF translatePos(QPointF pos_, turtleMove nextMove);
int translateOrnt(int orientation ,turtleMove move);
// int translateOrnt(int orientation, turtleMove nextMove);
// OK to change below this line

turtleMove studentMoveTurtle(bool& bump, bool& atEnd);
enum Direction{NORTH, WEST, SOUTH, EAST};


void setOrientation(Direction ornt);
void setAtend(bool end);
bool will_bump();
Direction get_orientation();
void mock_set_bump(bool bump);
bool get_bump();
bool get_atEnd();
int mock_translateOrnt(int orientation ,turtleMove move);
static const int numDirections = 4;
enum STATE{DUMMY, S1_CHECK_END, S2_CHECK_FUNCTION,S3_CHECK_DIRECTION,S4_MOVE,S5_GOAL};

struct Point{
  double x;
  double y;
};

void ROS_ERROR(std::string e);
void displayVisits(int i);
