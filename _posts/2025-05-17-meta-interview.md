---
layout: post
date: 2025-05-17 20:36:00 -0800
title: Meta Interview 2025
categories: home
---

Most people suggests keeping interview every year to make sure you have the ability to find a better job, especially when you're fired.

This should be the 3rd or 4th times to interview Facebook/Meta. Without surprise, I fail again. But I feel much better because I didn't expect anything in the beginning. I don't think I'm ready to join Meta, especially many people mention the survival rate as L6 in Meta is very low. I just told myself it's another try to learn something.

Here briefly records my interview process and some thoughts. I could not leak the interview questions, but I list all the leetcode problems with Meta tag based on https://www.1point3acres.com/bbs/thread-1117997-1-1.html.

### First Interview

I was contacted by the Meta recruiter because I was interviewed 2023. I didn't try Meta 2024 even I was contacted too, because I didn't have plan to join Meta. This year is the same, but I want to know my interview skill, so I decided to try.

In the first interview(45min), I met a nice guy, who has soft voice. I was asked 2 easy Leetcode questions. I quickly hacked the first question. I hack the second question too, but not the optimal solution. Fortunately I passed the first interview. So I scheduled the onsite interview in 4 weeks later.

In the last 5mins of the interview, I'm asking one question, what's the point if the leetcode question could not figure out if the candidate is great in the daily job, because Meta keeps laying off low performance employees? He just answered this was still the best way before they figured out a better way.

### Virtual Onsite

Virtual onsite interviews still have 5 sessions, but were scheduled in 2 days. Sessions 1-3 were in the first day, another 2 sessions were in the second day.

#### Session 1: Coding

This interviewer is a nice guy, polite and warm. Try to discuss the problem, not challege the interviewee. I got 2 Leetcode Medium problems.

#### Session 2: System Design

A Chinese interviewer, who is aggresive and challenge interviewee all the time. I didn't like him. I feel I should be failed by this guy. His design question was a bad example when I was trained as interviewer in Uber. For example, design a system like Uber. This kind of design question is meaningless, because Uber has a lot of systems, do you want to design booking, login, tracking, payment, etc. So the design question should be specific.

So I ask some questions, then he mentioned some key requirements to make the scope clear. Of course the interview question is not design Uber, but it's design XXX.

I provided one client heavy solution, but avoid server side complexity, which is not expected by the interviewer, but it works, even works without big problem from scaling thousands users to million users, because it doesn't need to worry about server scaling up. The client logic is not too complex.

It seems the interviewer is not familiar with the client, so it's very surprised for him. But he didn't guide me to the server solution, so he could not ask more deeper questions. But the interview session is finished 10 mins earlier, not 5 mins as other sessions. I felt we both want to finish the unhappy discussion as soon as possible.

#### Session 3: Coding

It is a Chinese interviewer too, but this guy is much nice. It seems we were discussing something. If I didn't provide his expected answers, he would provide some hints to lead me to the right direction he wanted.

The first question is easier, but we discuss some time and space complexity in the recursive solution. Then I changed the recursive to while-loop solution. Actually I know the optimal solution, I should go for it directly, then I will not waste time in the time/space complexity discussion, especially which shows I'm not very familiar with the O(n) calculation. In the end, I provided right answers with his hints.

The second question is a hard question. I didn't finish it, but provide some key points like BFS idea, and implemented the BFS.

#### Session 4: Product Design

The last product design discussion had a broader scope, including metrics definition. This time, the focus is narrowed to system design, specifically looking at the system's architecture and boundaries (breadth of components and connections) rather than implementation depth, no product idea and strategy questions.

This interviewer was nice too.

#### Session 5: Behavior

Another nice interviewer, who is a researcher and should has higher level. Just follow the STAR rules to answer different questions. It's a nice discussion and we can learn from each other. Usually the higher position person, the more humble and nicer.

The better interviewer tries to find your shining part and hope your interview successful.

### LeetCode Problems Asked By Meta

All the interview questions are from Leetcode, so please practise as many as possible if you really want to get the Meta position. All these problems are from https://www.1point3acres.com/bbs/thread-1117997-1-1.html.

88. Merge Sorted Array Easy.
543. Diameter of Binary Tree Easy
56. Merge Intervals Med
1004. Max Consecutive Ones III Med
509. Fibonacci Number Easy
317. Shortest Distance from All Buildings Hard
1249. Minimum Remove to Make Valid Parentheses Med
408. Valid Word Abbreviation Easy
199. Binary Tree Right Side View Med.
215. Kth Largest Element in an Array Med
680. Valid Palindrome II Easy
560. Subarray Sum Equals K Med
314. Binary Tree Vertical Order Traversal Med
1762. Buildings With an Ocean View Med
125. Valid Palindrome Easy
227. Basic Calculator II Med
1650. Lowest Common Ancestor of a Binary Tree III Med.
50. Pow(x, n) Med
339. Nested List Weight Sum Med
236. Lowest Common Ancestor of a Binary Tree Med.
1. Two Sum Easy
528. Random Pick with Weight Med.
1091. Shortest Path in Binary Matrix Med
347. Top K Frequent Elements Med
146. LRU Cache Med
827. Making A Large Island Hard
346. Moving Average from Data Stream Easy
973. K Closest Points to Origin Med
129. Sum Root to Leaf Numbers Med
138. Copy List with Random Pointer Med
23. Merge k Sorted Lists Hard. 
34. Find First and Last Position of Element in Sorted Array Med
71. Simplify Path Med.
1539. Kth Missing Positive Number Easy
121. Best Time to Buy and Sell Stock Easy
162. Find Peak Element Med.--
1570. Dot Product of Two Sparse Vectors Med
31. Next Permutation Med. Waral dи,
76. Minimum Window Substring Hard
133. Clone Graph Med
863. All Nodes Distance K in Binary Tree Med. ----
921. Minimum Add to Make Parentheses Valid Med
938. Range Sum of BST Easy
249. Group Shifted Strings Med
791. Custom Sort String Med
523. Continuous Subarray Sum Med.
480. Sliding Window Median Hard. Frombbs
498. Diagonal Traverse Med
986. Interval List Intersections Med
987. Vertical Order Traversal of a Binary Tree Hard
20. Valid Parentheses Easy
636. Exclusive Time of Functions Med .. 
670. Maximum Swap Med
207. Course Schedule Med.
708. Insert into a Sorted Circular Linked List Med
282. Expression Add Operators Hard
15. 3Sum Med
19. Remove Nth Node From End of List Med
536. Construct Binary Tree from String Med.
73. Set Matrix Zeroes Med
301. Remove Invalid Parentheses Hard
489. Robot Room Cleaner Hard
1768. Merge Strings Alternately Easy.
8. String to Integer (atoi) Med
1047. Remove All Adjacent Duplicates In String Easy
126. Word Ladder II Hard
127. Word Ladder Hard
643. Maximum Average Subarray I Easy
200. Number of Islands Med
724. Find Pivot Index Easy
219. Contains Duplicate II Easy
235. Lowest Common Ancestor of a Binary Search Tree Med
426. Convert Binary Search Tree to Sorted Doubly Linked List Med.
2667. Create Hello World Function Easy
253. Meeting Rooms II Med
270. Closest Binary Search Tree Value Easy
295. Find Median from Data Stream Hard
348. Design Tic-Tac-Toe Med
415. Add Strings Easy
958. Check Completeness of a Binary Tree Med
3. Longest Substring Without Repeating Characters Med
4. Median of Two Sorted Arrays Hard
33. Search in Rotated Sorted Array Med
53. Maximum Subarray Med
65. Valid Number Hard
67. Add Binary Easy. 
70. Climbing Stairs Easy
1216. Valid Palindrome III Hard.
766. Toeplitz Matrix Easy
1757. Recyclable and Low Fat Products Easy
398. Random Pick Index Med
1891. Cutting Ribbons Med
2. Add Two Numbers Med
5. Longest Palindromic Substring Med
14. Longest Common Prefix Easy. 
26. Remove Duplicates from Sorted Array Easy.
605. Can Place Flowers Easy
94. Binary Tree Inorder Traversal Easy
2551. Put Marbles in Bags Hard
124. Binary Tree Maximum Path Sum Hard
647. Palindromic Substrings Med
1094. Car Pooling Med
189. Rotate Array Med
202. Happy Number Easy
238. Product of Array Except Self Med
269. Alien Dictionary Hard
784. Letter Case Permutation Med
2265. Count Nodes Equal to Average of Subtree Med
2235. Add Two Integers Easy
824. Goat Latin Easy
825. Friends Of Appropriate Ages Med
378. Kth Smallest Element in a Sorted Matrix Med
399. Evaluate Division Med
2401. Longest Nice Subarray Med
977. Squares of a Sorted Array Easy
9. Palindrome Number Easy
529. Minesweeper Med
1443. Minimum Time to Collect All Apples in a Tree Med.
22. Generate Parentheses Med
27. Remove Element Easy
1060. Missing Element in Sorted Array Med
42. Trapping Rain Water Hard
556. Next Greater Element III Med
49. Group Anagrams Med
1493. Longest Subarray of 1's After Deleting One Element Med. Frombbs
55. Jump Game Med
58. Length of Last Word Easy
62. Unique Paths Med
66. Plus One Easy
1482. Minimum Number of Days to Make m Bouquets Med
3396. Minimum Number of Operations to Make Elements in Array Distinct Easy
74. Search a 2D Matrix Med
98. Validate Binary Search Tree Med
101. Symmetric Tree Easy
116. Populating Next Right Pointers in Each Node Med
122. Best Time to Buy and Sell Stock II Med
123. Best Time to Buy and Sell Stock III Hard
148. Sort List Med
149. Max Points on a Line Hard
658. Find K Closest Elements Med. 
163. Missing Ranges Easy
678. Valid Parenthesis String Med 
167. Two Sum II - Input Array Is Sorted Med
169. Majority Element Easy
173. Binary Search Tree Iterator Med
695. Max Area of Island Med.
1614. Maximum Nesting Depth of the Parentheses Easy
716. Max Stack Hard
721. Accounts Merge Med
2140. Solving Questions With Brainpower Med.
242. Valid Anagram Easy
246. Strobogrammatic Number Easy
247. Strobogrammatic Number II Med
2256. Minimum Average Difference Med
814. Binary Tree Pruning Med
328. Odd Even Linked List Med
332. Reconstruct Itinerary Hard
368. Largest Divisible Subset Med. Χ
875. Koko Eating Bananas Med
478. Generate Random Point in a Circle Med. 
410. Split Array Largest Sum Hard
424. Longest Repeating Character Replacement Med
1861. Rotating the Box Med
1854. Maximum Population Year Easy
934. Shortest Bridge Med
485. Max Consecutive Ones Easy
494. Target Sum Med
2877. Create a DataFrame from List Easy
