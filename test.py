from whiteboard import solution
from unittest import TestCase


class TestSearchInsert(TestCase):

    def test_solution_sorted_1(self):
        self.assertEqual(solution([5, 4, 3, 2, 1]), [
                         "Gold Medal", "Silver Medal", "Bronze Medal", "4", "5"])

    def test_solution_sorted_2(self):
        self.assertEqual(solution([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]), [
                         "Gold Medal", "Silver Medal", "Bronze Medal", "4", "5", "6", "7", "8", "9", "10"])

    def test_solution_sorted_3(self):
        self.assertEqual(solution([15, 6, 4, 3, 1]), [
            "Gold Medal", "Silver Medal", "Bronze Medal", "4", "5"])
