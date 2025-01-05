---
layout: post
date: 2021-10-11 10:02:38 -0700
title: Stripe Full-Stack Eng interview
categories: home
---

Stripe interview is an interesting experience, which is different to the LeetCode style. It's great to know the process and it will help you to get the position next time at least.

### Process

Most interview problems could be found online, I will not list the detail problem because of NDA. It's fine if you could not find the problems online. Just remember the problems are easy, so clam down in the interview to show your real ability.

Each round is 1 hour except the Manager discussion session, 45 mins.

1. Coding practise. It's a normal coding interview, but the problem is at easy level in LeetCode. No special data structure and algorithm, just understanding the problem and resolve it with clear code. It has 2 steps. I finished the 2 steps and an extra edge case optimization. After that, I still have some time to chat with the interviewer.

2. Bug squash. This is a sepcial session in the Stripe interview. It asks you to clone a private stripe repo with a bug. It shows the failed test and explain how to debug the failed test. Your tast is figuring out the bug and fix it. This one has much pressure in the limited 1 hour if you don't know the project and context. The Chrome debug tool could not remember the breakpoint if the test session is killed and restarted. With the hint I almost fix the problem. But it was quiet in the beginning of this session, because you need to focus on the debuging.

3. Manager session. Discuss your project experiences and ask Manager some questions. Before the interview please make sure you have a complex project to share the problem difficulties, scope, contribution and result.

4. Integration Coding. This is similar to #1, but has more steps. I spent too much time to debug downloading images via `node-fetch` with nodejs. At last, the interviewer abandoned help me resolving the download issue after we tried different solutions. Fortunately I figure it out when the interviewer said "I have no idea why this happens". Then I used the last 10 mins to finish the step 3. But I didn't have time to do step 4 and 5, which are should be easy like step 2.

5. UI coding. Develop an UI component with any framework. This is easy to implement but very hard to optimize it. Fortunately the interview doesn't require to optimize it. I finish it in time and clean the code. Then have some time to chat with the interviewer.

### Conclusion

#### Pros

1. It's very like real work experience, not focusing on the unuseful coding algorithms, such as DP, and some tricky coding skills.
2. It requires better practical coding skills, like clean code, easy to extend and maintain and debugging skills.
3. It encourage communication and co-working.

#### Cons
1. All problems are long and requires the interviewee to read a lot to understand the problem. Especially the Integration Coding session, I didn't finish all the reading for the API introduction. So I'm confused by the problem descriptions.
2. The Bug squash is not a good one, because nobody will do the debugging in the unfamiliar code with limit time without any context in the real work.
3. Some problem requires specified skill, like downloading image to local. It should not the core part in the interview, it's better to provide some function to do that without interviewee to set it up manually. The interview preparation doc only mentions the http request, but doesn't highlight the downloading part.

