/*
 * 18-642 Unit Testing Example
 * Example code by Milda Zizyte
 * This code exercises Transitions T1 and T2 of the Project 8
 * dummy turtle statechart. It uses the CUnit framework (cunit.sourceforge.net)
 */

#include "student_mock.h"
#include <CUnit/Basic.h>

bool bump = false;
bool atEnd = false;
turtleMove move_state;
int orientation = NORTH;
int numTurn = 0;

void setAtend(bool end) {
  atEnd = end;
}

/* Functions used to instrument CUnit tests */
int test_orientation_result() {
  return orientation;
}

void numTurns(int turns) {
  numTurn = turns;
}

void setOrientation(Direction ornt) {
  orientation = ornt;
}



void test_RESET() {
  move_state = studentMoveTurtle(bump, atEnd);
  orientation = test_orientation_result();
  
  CU_ASSERT_EQUAL(atEnd, false);
  CU_ASSERT_EQUAL(orientation, NORTH);
  CU_ASSERT_EQUAL(move_state, NO_MOVE);
}


void test_END() {

  setAtend(true);
  setOrientation(NORTH);
  move_state = studentMoveTurtle(bump, atEnd);
  orientation = test_orientation_result();

  CU_ASSERT_EQUAL(orientation, NORTH);
  CU_ASSERT_EQUAL(move_state, NO_MOVE);
}


void test_NORTH() {
  setAtend(false);
  numTurns(0); 
  setOrientation(EAST);
  move_state = studentMoveTurtle(bump, atEnd);
  orientation = test_orientation_result();

  CU_ASSERT_EQUAL(orientation, NORTH);
  CU_ASSERT_EQUAL(move_state, TURN_LEFT);
}

void test_SOUTH() {
  setAtend(false);
  numTurns(0); 
  setOrientation(WEST);
  move_state = studentMoveTurtle(bump, atEnd);
  orientation = test_orientation_result();

  CU_ASSERT_EQUAL(orientation, SOUTH);
  CU_ASSERT_EQUAL(move_state, TURN_LEFT);
}

void test_EAST() {
  setAtend(false);
  numTurns(0); 
  setOrientation(SOUTH);
  move_state = studentMoveTurtle(bump, atEnd);
  orientation = test_orientation_result();

  CU_ASSERT_EQUAL(orientation, EAST);
  CU_ASSERT_EQUAL(move_state, TURN_LEFT);
}

void test_WEST() {
  setAtend(false);
  numTurns(0); 
  setOrientation(NORTH);
  move_state = studentMoveTurtle(bump, atEnd);
  orientation = test_orientation_result();

  CU_ASSERT_EQUAL(orientation, WEST);
  CU_ASSERT_EQUAL(move_state, TURN_LEFT);
}


void test_MOVE() {
  setAtend(false);
  numTurns(4); 
  setOrientation(WEST);
  move_state = studentMoveTurtle(bump, atEnd);
  orientation = test_orientation_result();

  CU_ASSERT_EQUAL(orientation, WEST);
  CU_ASSERT_EQUAL(move_state, MOVE);
}


// void test_t2() {
//   mock_set_bump(true);
//   move_state return_state = moveTurtle(MOVE_FORWARD, false);
//   orientation output_orienation = test_orientation_result();

//   CU_ASSERT_EQUAL(output_orienation, UP);
//   CU_ASSERT_EQUAL(return_state, MOVE_BACK);
// }

int init() {
  // Any test initialization code goes here
  return 0;
}

int cleanup() {
  // Any test cleanup code goes here
  return 0;
}

/* Skeleton code from http://cunit.sourceforge.net/example.html */
int main() {

  CU_pSuite pSuite = NULL;

  /* initialize the CUnit test registry */
  if (CUE_SUCCESS != CU_initialize_registry())
    return CU_get_error();

  /* add a suite to the registry */
  pSuite = CU_add_suite("Suite_1", init, cleanup);
  if (NULL == pSuite) {
    CU_cleanup_registry();
    return CU_get_error();
  }

  /* add the tests to the suite */
  if ((NULL == CU_add_test(pSuite, "test of transition T1", test_RESET)) ||
      (NULL == CU_add_test(pSuite, "test of transition T2", test_END)))
    {
      CU_cleanup_registry();
      return CU_get_error();
    }
  
  /* Run all tests using the CUnit Basic interface */
  CU_basic_set_mode(CU_BRM_VERBOSE);
  CU_basic_run_tests();
  CU_cleanup_registry();
  return CU_get_error();

  return 0;
}


