---
layout: post
date: 2016-03-16 01:24:35 -0700
title: Interview Questions
categories: home
---

Recent days knows a lot of interview questions, some of them are interesting.

## Question 1
We have `n` houses and `m` colors, to paint house `i` with color `j`, we need pay money `prices[i][j]`. Note adjacent houses cannot use same color to paint. Find the cheapest way to paint the `n` houses with `m` colors.


  DP problem. Suppose P[i][j] represents the min payment paint houses from 0 to i and house i with color j. So

  P[i][j] = min{P[i-1][k]} + prices[i][j],  k=0 to m-1 and k != j

  The final result is min{P[n-1][j]} where j=[0, m-1].

## Question 2
We have `n` houses in a circle and each house has cash `cash[i]`. Suppose theft grab the cash from these houses, he cannot grab the money from adjacent houses. For example, we have 5 houses, possible way is grab house [0, 2], but [0, 2, 4] is not possible, because houses 0 and 4 are adjacent in circle. (DP question)

## Question 3
Binary tree, add next pointer to each node which points to the adjacent right node. For example:


                          a
                    b           c
                 d     e     #     f  

\# means empty node. So we have to make b.next points to c, d.next points to e, e.next points to f.

Solution: BFS can solve it. Also we can use recursive without extra space.

## Question 4
Reverse linked list since start position to end position, like function reverse(Node head, int start, int end).

## Question 5
Binary Tree rotate 90 degree in clockwise, suppose right node is empty or leaf node.

example 1:

                      a                              b
                  b       c          =>          c       a

example 2:

                      a                              f
                  b        c        =>                   d
              d       e                               e      b
          f                                              c       a

## Question 6
How to design twitter/linkedin home page?

You have to know browser event model, capture/target/bubble phases, to optimize the event handler on duplicate items like multiple twitter messages. Know some basic css layout, like float, clearfix.

## Question 7
How to design system to mrege all profiles from different social platform, like twitter, facebook, netflix, amazon.

This is design question for client and server, so you have to get detail requirements form interviewer, then make it happen step by step. Server gets all profiles from different providers and merge them together then send to client. Client display it and allow user to edit it.

## Question 8
Implement JS function bind method, see more from [mdn Function.bind](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind).

This is very helpful to understand "this" in js. For Function.prototype.bind, this means function itself.

## Question 9 (T)
A circle diameter is 1.0, a square size is 1.0 too. Check if this circle and square have overlap.

## Question 10 (F)
Suppose we can encode '1' to 'a', '2' to 'b', '26' to 'z'. Output how many ways to encode input digit strings. For example,

1 => 'a', so output is 1.
1234 => 'abcd', 'awd', 'lcd', so output is 3.

## Question 11
Implement event manager, which has addEventListener, removeEventListener, dispatchEvent functions.

## Question 12 (F)
Check if two trees are same.

```JavaScript

  // suppose Node type like {value: number, left: Node, right: Node}
  function isSameTree(root1, root2) {
    if (root1 === root2) return true;
    if (!root1 || !root2) return false;
    if (root1.value !== root2.value) return false;
    return isSameTree(root1.left, root2.left) && isSameTree(root1.right, root2.right);
  }

```

See leetcode [same tree](https://leetcode.com/problems/same-tree/)

## Question 13 (F)
A 2-dimension matrix with value 0 or 1, 0 means you can pass, 1 is blocked. Now from top left to bottom right, output the total paths. Note: you can only move right or bottom for each step.

See similar question from leetcode [unique paths 2](https://leetcode.com/problems/unique-paths-ii/).

## Question 14 (F)
An integer array, check if possible to find two values sum as target integer. For example, [1, 3, -2, 5] and target number 6, return true, because we have {1, 5}, but for target number 10 we return false.

Further question, how to find 4 numbers which sum is target number.

See leetcode [2Sum](https://leetcode.com/problems/two-sum/), [4Sum](https://leetcode.com/problems/4sum/)

## Question 15 (F)
An integer array, check if possible to find continues sub array whose sum is target number. For example, [1, 2, -1, 4] and target number 5, we can find [2, -1, 4], so return true; but for target 7, return false.

See similar question from [geeksforgeeks](http://www.geeksforgeeks.org/find-subarray-with-given-sum/).
But [this one](http://www.geeksforgeeks.org/find-if-there-is-a-subarray-with-0-sum/) from geeksforgeeks is almost the same

## Question 16 (F)
An 2-dimension array filled with letters, we can suppose they are just from 'a' to 'z'. Each item in this matrix, it connects to four adjacent elements. Given a word, try to check if it's possible to find target word. For example, given below matrix and word 'dad', return true, because we can find 'dad' on the second row; given word 'dab', return true, because we can find 'da' on the second row, then up to 'b'; given word 'ca', return false.

    a    b    c
    d    a    d

See leetcode [word search](https://leetcode.com/problems/word-search/)

## Question 17
Design an algorithm to encode a list of strings to a string. The encoded string is then sent over the network and is decoded back to the original list of strings.

See [Encode and Decode Strings](http://buttercola.blogspot.com/2015/09/leetcode-encode-and-decode-strings.html), this is also a leetcode question, but is only visible to subscriber.

## Question 18 (G, 45 mins)
A map is 2-dimension array filled with 0 or 1. Find the count of connected blocks filled with 1. Suppose each item is connected to the top, left, right, bottom item. For example below map, we have 3 blocks filled with 1.

    0 0 0 1 0
    0 0 1 1 1
    1 0 0 1 0
    1 0 0 0 0
    0 1 0 0 0

Further, if we have function like, update(row, col), which set cell at row, col to 1, now return how many count of blocks with 1.

## Question 19 (G, 45 mins)
Design question, suppose web page has one input text and submit button, enter some text in the input then click submit button to post the data to server side; server side to return result; client should display the result as a table.

Next step, if there is million result on the server, what you need to do? Yes, paging the result. Please design the server response and the client pager, which may just have previous and next page button. Finish the click event handler for those two buttons.

Next step, if it needs much time to return the response, such as 1 hour, what need to do on the client and server side. Yes, we can use io.socket to communiate between client and server to show the progress. If server doesn't want to keep so many connections, client can poll periodically.

## Question 20 (G, 45 mins)
JS stuff. Implement function extend(BaseClass, SubClass, props).

Another one, check if input is correct UTF-8 codings. such as function checkUTFEncodings(bytes).
Parameter bytes is ByteArray. The UTF-8 definition you can find from [wiki](https://en.wikipedia.org/wiki/UTF-8#Description).

Actually both questions are simple, but I mess them up :(, first one I cannot make 'new SubClass() instanceof BaseClass' return true.
The second one I didn't finish in time because I made code complex, it should use bit operation.

## Question 21 (G, 45 mins)
Input any string and a collection of words, return the shortest word which is beginning with the input string in our word collection. Such as input string "car", and we have words "car", "care", we need return "car"; if input string is "ca", we should return "car" too; if input is "da", we should return null.

This is [Trie](https://en.wikipedia.org/wiki/Trie), see leetcode [prefix tree](https://leetcode.com/problems/implement-trie-prefix-tree/) and [word search 2](https://leetcode.com/problems/word-search-ii/)

## Question 22 (G, 45 mins)
Input a collection of strings, like below,

    [
      'cat',
      'oh',
      'lol'
    ]

We want to get output like below
    [
      'col', 'coo', 'col',
      'chl', 'cho', 'chl',
      'aol', 'aoo', 'aol',
      ...
      'thl', 'tho', 'thl'
    ]

so suppose we have blow code:
  var cp = new CP(['cat', 'oh', 'lol']);
  cp.next();  // return the first string in the output array
  cp.next();  // return the second string in the output array

So at the beginning you may construct the whole output array, then implmenet next function.

You will be asked, if we don't need to construct the output array first, we want to get the each output string when call next function, how to make it work?
