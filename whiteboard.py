# You are given a reversed, sorted integer array score of size n, where score[i] is the score of the ith athlete in a competition. All the scores are guaranteed to be unique.

# The athletes are placed based on their scores, where the 1st place athlete has the highest score, the 2nd place athlete has the 2nd highest score, and so on. The placement of each athlete determines their rank:

# The 1st place athlete's rank is "Gold Medal".
# The 2nd place athlete's rank is "Silver Medal".
# The 3rd place athlete's rank is "Bronze Medal".
# For the 4th place to the nth place athlete, their rank is their placement number (i.e., the xth place athlete's rank is "x").
# Return an array answer of size n where answer[i] is the rank of the ith athlete.

# Example 1:

# Input: score = [5,4,3,2,1]
# Output: ["Gold Medal","Silver Medal","Bronze Medal","4","5"]
# Explanation: The placements are [1st, 2nd, 3rd, 4th, 5th].

# Example 2:

# Input: score = [10, 9, 8, 5, 4, 3]
# Output: ["Gold Medal", "Silver Medal", "Bronze Medal", "4", "5", "6"]
# Explanation: The placements are [1st, 2nd, 3rd, 4th, 5th, 6th].

# Example 3:

# Input: score = [15, 6, 4, 3, 1]
# Output: ["Gold Medal", "Silver Medal", "Bronze Medal", "4", "5"]
# Explanation: The placements are [1st, 2nd, 3rd, 4th, 5th].


def solution(scores):
    # write your code here
    scores_in_order = sorted(scores, reverse=True)
    output = []
    for score in scores:
        place = scores_in_order.index(score) + 1
        award = 'Gold Medal' if place == 1 else 'Silver Medal' if place == 2 else 'Bronze Medal' if place == 3 else str(place)
        output.append(award)
    return output

print(solution([5,4,3,2,1]))


def solution(score):
    final_score = []
    new_list = sorted(score, reverse = True) # O(n log n)
    for i in score: # O(n)
        if i == new_list[0]:
            final_score.append("Gold Medal")
        elif i == new_list[1]:
            final_score.append("Silver Medal")
        elif i == new_list[2]:
            final_score.append("Bronze Medal")
        else:
            final_score.append(str(new_list.index(i) +1))
    return final_score
print(solution([5,4,3,2,1]))
