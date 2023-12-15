/*
 * 18-642 Unit Testing Example
 * Example code by Milda Zizyte
 * This code exercises Transitions T1 and T2 of the Project 8
 * dummy turtle statechart. It uses the CUnit framework (cunit.sourceforge.net)
 */

#include <CUnit/Basic.h>
#include "student_mock.h"

turtleMove move_state;
Direction mock_orientation;
int numTurn = 0;

void numTurns(int turns) {
  numTurn = turns;
}

void test_RESET() {
  bool bump = get_bump();
  bool atEnd = get_atEnd();
  mock_orientation = get_orientation();
  
  CU_ASSERT_EQUAL(atEnd, false);
  CU_ASSERT_EQUAL(mock_orientation, NORTH);
}


void test_END() {
  bool bump = get_bump();
  setAtend(true);
  bool atEnd = get_atEnd();
  setOrientation(NORTH);
  move_state = studentMoveTurtle(bump, atEnd);
  mock_orientation = get_orientation();

  CU_ASSERT_EQUAL(mock_orientation, NORTH);
  CU_ASSERT_EQUAL(move_state, NO_MOVE);
}


void test_NORTH() {
  bool bump = get_bump();
  setAtend(false);
  bool atEnd = get_atEnd();

  setAtend(false);
  numTurns(0); 
  setOrientation(NORTH);
  mock_orientation = get_orientation();
  move_state = studentMoveTurtle(bump, atEnd);
  mock_translateOrnt(mock_orientation ,move_state);
  mock_orientation = get_orientation();

  CU_ASSERT_EQUAL(mock_orientation, EAST);
  CU_ASSERT_EQUAL(move_state, TURN_RIGHT);
}

void test_SOUTH() {
  bool bump = get_bump();
  setAtend(false);
  bool atEnd = get_atEnd();

  setAtend(false);
  numTurns(0); 
  setOrientation(SOUTH);
  mock_orientation = get_orientation();
  move_state = studentMoveTurtle(bump, atEnd);
  mock_translateOrnt(mock_orientation ,move_state);
  mock_orientation = get_orientation();

  CU_ASSERT_EQUAL(mock_orientation, WEST);
  CU_ASSERT_EQUAL(move_state, TURN_RIGHT);
}

void test_EAST() {
  bool bump = get_bump();
  setAtend(false);
  bool atEnd = get_atEnd();

  setAtend(false);
  numTurns(0); 
  setOrientation(EAST);
  mock_orientation = get_orientation();
  move_state = studentMoveTurtle(bump, atEnd);
  mock_translateOrnt(mock_orientation ,move_state);
  mock_orientation = get_orientation();

  CU_ASSERT_EQUAL(mock_orientation, SOUTH);
  CU_ASSERT_EQUAL(move_state, TURN_RIGHT);
}

void test_WEST() {
   bool bump = get_bump();
  setAtend(false);
  bool atEnd = get_atEnd();
  setAtend(false);
  setOrientation(WEST);

  move_state = studentMoveTurtle(bump, atEnd);
  mock_translateOrnt(mock_orientation ,move_state);
  mock_orientation = get_orientation();
  CU_ASSERT_EQUAL(mock_orientation, NORTH);
  CU_ASSERT_EQUAL(move_state, TURN_RIGHT);


}

void test_MOVE() {
  bool bump = get_bump();
  setAtend(false);
  bool atEnd = get_atEnd();
  setAtend(false);
  numTurns(4); 
  setOrientation(NORTH);

  move_state = studentMoveTurtle(bump, atEnd);
  mock_translateOrnt(mock_orientation ,move_state);
  mock_orientation = get_orientation();
  CU_ASSERT_EQUAL(mock_orientation, NORTH);
  CU_ASSERT_EQUAL(move_state, MOVE);
}



int init() {
  // Any test initialization code goes here
  setOrientation(NORTH);
  setAtend(false);
  numTurns(0); 

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
  if ((NULL == CU_add_test(pSuite, "test of test_RESET", test_RESET)) ||
      (NULL == CU_add_test(pSuite, "test of test_NORTH", test_NORTH)) ||
      (NULL == CU_add_test(pSuite, "test of test_SOUTH", test_SOUTH)) ||
      (NULL == CU_add_test(pSuite, "test of test_EAST", test_EAST)) ||
      (NULL == CU_add_test(pSuite, "test of test_WEST", test_WEST)) ||
      (NULL == CU_add_test(pSuite, "test of test_MOVE", test_MOVE)) ||
      (NULL == CU_add_test(pSuite, "test of test_END", test_END)))
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


