#not done



class Solution:
    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:
        # median of sorted array

        # Quicksort O(nlogn)
        # log n means to split it in half and then half it

        # find the median of the arrays then pick
        # supoose 1, 4, 7, 9 and 2, 3, 5 put together 1, 2, 3, 4, 5, 7, 9 median is 4
        # make assumption that the median of the two must be between or equal to the two medians existing
        # so if it's 4 and 3 then
        # since 4 > 3 -> look at from first 1, from second 5
        # case of even count --> divide
        # assume that numbers are integers!
        # baseline case :
        # when sum of len is even then when the next number in smaller is bigger than larger number in the other array then stop and the vice versa on the other side then sum of the two and then divide
        # when sum is odd then find a single number the question is then how do you decide when one is the median (if it's odd it means one of them will always be even)

        # nums1 = [1, 3, 7, 9, 10]
        # nums2 = [2, 4, 5, 11]
        # [1, 2, 3, 4, 5, 7, 9, 10, 11] == > 5
        # median
        #
        # n = 5
        # m = 4
        # s = 9
        #
        # # 1
        # nl = [1, 3, 7, 9, 10]
        # ml = [2, 4, 5, 11]
        # n = 5
        # m = 4
        #
        # # 2
        # nl[2] = 7
        # ml[1] = 4
        # 7 > 4
        # nl = [1, 3, 7]
        # ml = [5, 11]
        # n = 3
        # m = 2
        #
        # # 3
        # nl[1] = 3
        # ml[1] = 11
        # 11 > 3
        # nl = [3, 7]
        # ml = [5]
        # n = 2
        # m = 1
        #
        # # 4
        # nl[1] = 3
        # ml[0] = 5
        # 5 > 3
        # nl = [3, 7]
        # ml = []

        n = len(nums1)
        m = len(nums2)
        s = n + m

        nl = nums1
        ml = nums2

        # print(nl)
        # print(ml)
        while n > 1 or m > 1:

            print(nl, n // 2)
            print(ml, m // 2)

            if nl[n // 2] < ml[m // 2]:
                nl = nl[n // 2:]
                n = len(nl) - 1
                ml = ml[:m // 2]
                m = len(ml) - 1
            else:
                nl = nl[:n // 2]
                n = len(nl) - 1
                ml = ml[m // 2:]
                m = len(ml) - 1
        result = 0
        if len(nums1) % 2 == 0 and s % 2 != 0:
            result = ml[0]
        elif len(nums2) % 2 == 0 and s % 2 != 0:
            result = nl[0]
        else:
            result = sum(nl[0] + ml[0]) / 2

        return result