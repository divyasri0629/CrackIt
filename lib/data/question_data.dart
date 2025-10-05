// import 'package:ishipp/screens/mcq_list_screen.dart';

import '../models/question_model.dart';


List<QuestionModel> questions = [
  QuestionModel(
    question: "1. Two Sum",
    pseudocode: """
for i in 0 to n-1:
  for j in i+1 to n:
    if arr[i] + arr[j] == target:
      return [i, j]
""",
    gfgLink: "https://www.geeksforgeeks.org/find-a-pair-with-the-given-sum-in-an-array/",
    lcLink: "https://leetcode.com/problems/two-sum/",
  ),
  QuestionModel(
    question: "2. Reverse a String",
    pseudocode: """
left = 0
right = length-1
while left < right:
  swap(str[left], str[right])
  left += 1
  right -= 1
""",
    gfgLink: "https://www.geeksforgeeks.org/write-a-program-to-reverse-an-array-or-string/",
    lcLink: "https://leetcode.com/problems/reverse-string/",
  ),

      
  QuestionModel(
    question: '3. Merge Two Sorted Lists',
    pseudocode: '''while list1 and list2:
  if list1.val < list2.val:
    append list1
    list1 = list1.next
  else:
    append list2
    list2 = list2.next''',
    gfgLink: 'https://www.geeksforgeeks.org/merge-two-sorted-linked-lists/',
    lcLink: 'https://leetcode.com/problems/merge-two-sorted-lists/',
  ),
  QuestionModel(
    question: '4. Valid Parentheses',
    pseudocode: '''stack = []
for ch in s:
  if open: stack.push()
  elif match: stack.pop()
  else: return False
return not stack''',
    gfgLink: 'https://www.geeksforgeeks.org/check-for-balanced-parentheses-in-an-expression/',
    lcLink: 'https://leetcode.com/problems/valid-parentheses/',
  ),
  QuestionModel(
    question: '5. Best Time to Buy and Sell Stock',
    pseudocode: '''min_price = inf
max_profit = 0
for price in prices:
  min_price = min(min_price, price)
  max_profit = max(max_profit, price - min_price)''',
    gfgLink: 'https://www.geeksforgeeks.org/stock-buy-sell/',
    lcLink: 'https://leetcode.com/problems/best-time-to-buy-and-sell-stock/',
  ),
  QuestionModel(
    question: '6. Maximum Subarray',
    pseudocode: '''max_sum = curr = arr[0]
for i in range(1, len(arr)):
  curr = max(arr[i], curr + arr[i])
  max_sum = max(max_sum, curr)''',
    gfgLink: 'https://www.geeksforgeeks.org/largest-sum-contiguous-subarray/',
    lcLink: 'https://leetcode.com/problems/maximum-subarray/',
  ),
  QuestionModel(
    question: '7. Climbing Stairs',
    pseudocode: '''if n <= 2: return n
for i from 3 to n:
  dp[i] = dp[i-1] + dp[i-2]''',
    gfgLink: 'https://www.geeksforgeeks.org/count-ways-reach-nth-stair/',
    lcLink: 'https://leetcode.com/problems/climbing-stairs/',
  ),
  QuestionModel(
    question: '8. Valid Anagram',
    pseudocode: '''if sorted(s) == sorted(t): return True else False''',
    gfgLink: 'https://www.geeksforgeeks.org/check-whether-two-strings-are-anagram-of-each-other/',
    lcLink: 'https://leetcode.com/problems/valid-anagram/',
  ),
  QuestionModel(
    question: '9. Merge Sorted Array',
    pseudocode: '''i = m - 1
j = n - 1
k = m + n - 1
while j >= 0:
  if i >= 0 and nums1[i] > nums2[j]:
    nums1[k] = nums1[i]
    i -= 1
  else:
    nums1[k] = nums2[j]
    j -= 1
  k -= 1''',
    gfgLink: 'https://www.geeksforgeeks.org/merge-two-sorted-arrays/',
    lcLink: 'https://leetcode.com/problems/merge-sorted-array/',
  ),
  QuestionModel(
    question: '10. Move Zeroes',
    pseudocode: '''j = 0
for i in range(len(nums)):
  if nums[i] != 0:
    nums[i], nums[j] = nums[j], nums[i]
    j += 1''',
    gfgLink: 'https://www.geeksforgeeks.org/move-zeroes-end-array/',
    lcLink: 'https://leetcode.com/problems/move-zeroes/',
  ),
  QuestionModel(
    question: '11. Best Time to Buy and Sell Stock',
    pseudocode: '''min_price = inf
max_profit = 0
for price in prices:
  if price < min_price:
    min_price = price
  elif price - min_price > max_profit:
    max_profit = price - min_price''',
    gfgLink: 'https://www.geeksforgeeks.org/maximum-profit-by-buying-and-selling-a-share-at-most-twice/',
    lcLink: 'https://leetcode.com/problems/best-time-to-buy-and-sell-stock/',
  ),
  QuestionModel(
    question: '12. Longest Substring Without Repeating Characters',
    pseudocode: '''start = 0
max_len = 0
used = {}
for i, char in enumerate(s):
  if char in used and start <= used[char]:
    start = used[char] + 1
  else:
    max_len = max(max_len, i - start + 1)
  used[char] = i''',
    gfgLink: 'https://www.geeksforgeeks.org/length-of-the-longest-substring-without-repeating-characters/',
    lcLink: 'https://leetcode.com/problems/longest-substring-without-repeating-characters/',
  ),
  QuestionModel(
    question: '13. Valid Parentheses',
    pseudocode: '''stack = []
map = {')': '(', '}': '{', ']': '['}
for char in s:
  if char in map:
    top = stack.pop() if stack else '#'
    if map[char] != top:
      return False
  else:
    stack.append(char)
return not stack''',
    gfgLink: 'https://www.geeksforgeeks.org/check-for-balanced-parentheses-in-an-expression/',
    lcLink: 'https://leetcode.com/problems/valid-parentheses/',
  ),
  QuestionModel(
    question: '14. Implement Queue using Stacks',
    pseudocode: '''push(x): in_stack.push(x)
pop():
  if out_stack is empty:
    while in_stack:
      out_stack.push(in_stack.pop())
  return out_stack.pop()
peek():
  if out_stack is empty:
    while in_stack:
      out_stack.push(in_stack.pop())
  return out_stack[-1]
empty(): return not in_stack and not out_stack''',
    gfgLink: 'https://www.geeksforgeeks.org/implement-stack-using-queue/',
    lcLink: 'https://leetcode.com/problems/implement-queue-using-stacks/',
  ),
  QuestionModel(
    question: '15. Min Stack',
    pseudocode: '''push(x):
  stack.append(x)
  min_stack.append(min(x, min_stack[-1]))
pop():
  stack.pop()
  min_stack.pop()
top(): return stack[-1]
getMin(): return min_stack[-1]''',
    gfgLink: 'https://www.geeksforgeeks.org/design-and-implement-special-stack-data-structure/',
    lcLink: 'https://leetcode.com/problems/min-stack/',
  ),
  QuestionModel(
    question: '16. Linked List Cycle',
    pseudocode: '''slow = fast = head
while fast and fast.next:
  slow = slow.next
  fast = fast.next.next
  if slow == fast:
    return True
return False''',
    gfgLink: 'https://www.geeksforgeeks.org/detect-loop-in-a-linked-list/',
    lcLink: 'https://leetcode.com/problems/linked-list-cycle/',
  ),
  QuestionModel(
    question: '17. Intersection of Two Linked Lists',
    pseudocode: '''a, b = headA, headB
while a != b:
  a = a.next if a else headB
  b = b.next if b else headA
return a''',
    gfgLink: 'https://www.geeksforgeeks.org/write-a-function-to-get-the-intersection-point-of-two-linked-lists/',
    lcLink: 'https://leetcode.com/problems/intersection-of-two-linked-lists/',
  ),
  QuestionModel(
    question: '18. Reverse Linked List',
    pseudocode: '''prev = None
curr = head
while curr:
  next = curr.next
  curr.next = prev
  prev = curr
  curr = next
return prev''',
    gfgLink: 'https://www.geeksforgeeks.org/reverse-a-linked-list/',
    lcLink: 'https://leetcode.com/problems/reverse-linked-list/',
  ),
  QuestionModel(
    question: '19. Merge Two Sorted Lists',
    pseudocode: '''dummy = ListNode()
tail = dummy
while l1 and l2:
  if l1.val < l2.val:
    tail.next = l1
    l1 = l1.next
  else:
    tail.next = l2
    l2 = l2.next
  tail = tail.next
tail.next = l1 or l2
return dummy.next''',
    gfgLink: 'https://www.geeksforgeeks.org/merge-two-sorted-linked-lists/',
    lcLink: 'https://leetcode.com/problems/merge-two-sorted-lists/',
  ),
  QuestionModel(
    question: '20. Remove Nth Node From End of List',
    pseudocode: '''dummy = ListNode(0, head)
first = second = dummy
for _ in range(n):
  first = first.next
while first.next:
  first, second = first.next, second.next
second.next = second.next.next
return dummy.next''',
    gfgLink: 'https://www.geeksforgeeks.org/delete-nth-node-from-the-end-of-a-linked-list/',
    lcLink: 'https://leetcode.com/problems/remove-nth-node-from-end-of-list/',
  ),
  QuestionModel(
    question: '21. Count Inversions in Array',
    pseudocode: '''function mergeSort(arr, temp, left, right):
    inv_count = 0
    if left < right:
        mid = (left + right) // 2
        inv_count += mergeSort(arr, temp, left, mid)
        inv_count += mergeSort(arr, temp, mid + 1, right)
        inv_count += merge(arr, temp, left, mid, right)
    return inv_count''',
    gfgLink: 'https://www.geeksforgeeks.org/counting-inversions/',
    lcLink: 'https://leetcode.com/problems/reverse-pairs/',
  ),
  QuestionModel(
    question: '22. Reverse a Linked List',
    pseudocode: '''function reverseList(head):
    prev = None
    current = head
    while current:
        nextNode = current.next
        current.next = prev
        prev = current
        current = nextNode
    return prev''',
    gfgLink: 'https://www.geeksforgeeks.org/reverse-a-linked-list/',
    lcLink: 'https://leetcode.com/problems/reverse-linked-list/',
  ),
  QuestionModel(
    question: '23. Detect and Remove Loop in Linked List',
    pseudocode: '''function detectAndRemoveLoop(head):
    slow = fast = head
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
        if slow == fast:
            removeLoop(slow, head)
            return True
    return False''',
    gfgLink: 'https://www.geeksforgeeks.org/detect-and-remove-loop-in-a-linked-list/',
    lcLink: 'https://leetcode.com/problems/linked-list-cycle/',
  ),
  QuestionModel(
    question: '24. Merge Two Sorted Linked Lists',
    pseudocode: '''function mergeTwoLists(l1, l2):
    dummy = Node(0)
    current = dummy
    while l1 and l2:
        if l1.val < l2.val:
            current.next = l1
            l1 = l1.next
        else:
            current.next = l2
            l2 = l2.next
        current = current.next
    current.next = l1 or l2
    return dummy.next''',
    gfgLink: 'https://www.geeksforgeeks.org/merge-two-sorted-linked-lists/',
    lcLink: 'https://leetcode.com/problems/merge-two-sorted-lists/',
  ),
  QuestionModel(
    question: '25. Add Two Numbers Represented by Linked Lists',
    pseudocode: '''function addTwoNumbers(l1, l2):
    dummy = Node(0)
    current = dummy
    carry = 0
    while l1 or l2 or carry:
        sum = (l1.val if l1 else 0) + (l2.val if l2 else 0) + carry
        carry = sum // 10
        current.next = Node(sum % 10)
        current = current.next
        if l1: l1 = l1.next
        if l2: l2 = l2.next
    return dummy.next''',
    gfgLink: 'https://www.geeksforgeeks.org/add-two-numbers-represented-by-linked-lists/',
    lcLink: 'https://leetcode.com/problems/add-two-numbers/',
  ),
  QuestionModel(
    question: '26. LRU Cache Implementation',
    pseudocode: '''class LRUCache:
    initialize with capacity
    use hashmap for key-node mapping
    use doubly linked list to track usage order
    get(key): if key in hashmap, move to front and return value
    put(key, value): add/update key, move to front. If over capacity, remove least''',
    gfgLink: 'https://www.geeksforgeeks.org/lru-cache-implementation/',
    lcLink: 'https://leetcode.com/problems/lru-cache/',
  ),
  QuestionModel(
  question: '27. DFS and BFS',
  pseudocode: '''DFS:
function DFS(graph, start, visited):
    visited[start] = true
    for neighbor in graph[start]:
        if not visited[neighbor]:
            DFS(graph, neighbor, visited)

BFS:
function BFS(graph, start):
    queue = [start]
    visited = set([start])
    while queue:
        node = queue.removeFirst()
        for neighbor in graph[node]:
            if neighbor not in visited:
                visited.add(neighbor)
                queue.add(neighbor)''',
  gfgLink: 'https://www.geeksforgeeks.org/depth-first-search-or-dfs-for-a-graph/',
  lcLink: 'https://leetcode.com/problems/number-of-islands/',
),

QuestionModel(
  question: '28. Detect Cycle in Directed/Undirected Graph',
  pseudocode: '''function isCyclic(node, visited, recStack):
    visited[node] = true
    recStack[node] = true
    for neighbor in graph[node]:
        if not visited[neighbor] and isCyclic(neighbor, visited, recStack):
            return true
        elif recStack[neighbor]:
            return true
    recStack[node] = false
    return false''',
  gfgLink: 'https://www.geeksforgeeks.org/detect-cycle-in-a-graph/',
  lcLink: 'https://leetcode.com/problems/course-schedule/',
),

QuestionModel(
  question: '29. Topological Sort',
  pseudocode: '''function topologicalSort(node, visited, stack):
    visited[node] = true
    for neighbor in graph[node]:
        if not visited[neighbor]:
            topologicalSort(neighbor, visited, stack)
    stack.add(node)''',
  gfgLink: 'https://www.geeksforgeeks.org/topological-sorting/',
  lcLink: 'https://leetcode.com/problems/course-schedule-ii/',
),

QuestionModel(
  question: '30. Minimum Spanning Tree (Kruskal/Prim)',
  pseudocode: '''function Kruskal(edges, n):
    sort edges by weight
    parent = [i for i in range(n)]

    function find(x):
        if parent[x] != x:
            parent[x] = find(parent[x])
        return parent[x]

    mst_weight = 0
    for edge in edges:
        u, v, weight = edge
        if find(u) != find(v):
            mst_weight += weight
            parent[find(u)] = find(v)
    return mst_weight''',
  gfgLink: 'https://www.geeksforgeeks.org/graph-and-its-representations/',
  lcLink: 'https://leetcode.com/problems/connecting-cities-with-minimum-cost/',
),

QuestionModel(
  question: '31. Shortest Path (Dijkstra/Floyd Warshall)',
  pseudocode: '''function Dijkstra(graph, source):
    dist = [infinity] * len(graph)
    dist[source] = 0
    minHeap = PriorityQueue()
    minHeap.push((0, source))

    while minHeap is not empty:
        d, u = minHeap.pop()
        for v, weight in graph[u]:
            if dist[v] > dist[u] + weight:
                dist[v] = dist[u] + weight
                minHeap.push((dist[v], v))
    return dist''',
  gfgLink: 'https://www.geeksforgeeks.org/dijkstras-shortest-path-algorithm-greedy-algo-7/',
  lcLink: 'https://leetcode.com/problems/network-delay-time/',
),

QuestionModel(
  question: '32. Longest Increasing Subsequence',
  pseudocode: '''function LIS(arr):
    n = len(arr)
    dp = [1] * n
    for i in range(1, n):
        for j in range(i):
            if arr[i] > arr[j]:
                dp[i] = max(dp[i], dp[j] + 1)
    return max(dp)''',
  gfgLink: 'https://www.geeksforgeeks.org/longest-increasing-subsequence-dp-3/',
  lcLink: 'https://leetcode.com/problems/longest-increasing-subsequence/',
),

QuestionModel(
  question: '33. 0-1 Knapsack Problem',
  pseudocode: '''function knapsack(W, weights, values, n):
    dp = [[0 for x in range(W + 1)] for y in range(n + 1)]
    for i in range(n + 1):
        for w in range(W + 1):
            if i == 0 or w == 0:
                dp[i][w] = 0
            elif weights[i-1] <= w:
                dp[i][w] = max(values[i-1] + dp[i-1][w - weights[i-1]], dp[i-1][w])
            else:
                dp[i][w] = dp[i-1][w]
    return dp[n][W]''',
  gfgLink: 'https://www.geeksforgeeks.org/0-1-knapsack-problem-dp-10/',
  lcLink: 'https://leetcode.com/problems/partition-equal-subset-sum/',
),

QuestionModel(
  question: '34. Coin Change Problem',
  pseudocode: '''function coinChange(coins, amount):
    dp = [amount + 1] * (amount + 1)
    dp[0] = 0
    for coin in coins:
        for x in range(coin, amount + 1):
            dp[x] = min(dp[x], dp[x - coin] + 1)
    return dp[amount] if dp[amount] != amount + 1 else -1''',
  gfgLink: 'https://www.geeksforgeeks.org/coin-change-dp-7/',
  lcLink: 'https://leetcode.com/problems/coin-change/',
),

QuestionModel(
  question: '35. Maximum Profit in Stock Buy and Sell',
  pseudocode: '''function maxProfit(prices):
    min_price = infinity
    max_profit = 0
    for price in prices:
        if price < min_price:
            min_price = price
        elif price - min_price > max_profit:
            max_profit = price - min_price
    return max_profit''',
  gfgLink: 'https://www.geeksforgeeks.org/stock-buy-sell/',
  lcLink: 'https://leetcode.com/problems/best-time-to-buy-and-sell-stock/',
),];
final List<QuestionModell> questionapp = [
  // Aptitude
  QuestionModell(
    id: "1",
    category: "Aptitude",
    question: "1. Time and Work\nTheory: Work done is inversely proportional to time when number of workers is constant.",
    example: "If A can do a piece of work in 10 days and B in 15 days, how long will they take to complete it together?"
  ),
  QuestionModell(
    id: "2",
    category: "Aptitude",
    question: "2. Time, Speed and Distance\nTheory: Speed = Distance / Time.",
    example: "If a car travels 60 km in 1.5 hours, what is its average speed?"
  ),
  QuestionModell(
    id: "3",
    category: "Aptitude",
    question: "3. Ratio and Proportion\nTheory: Ratio compares two quantities. Proportion equates two ratios.",
    example: "Find the fourth proportional to 2, 6, and 8."
  ),
  QuestionModell(
     id: "3",
    category: "Aptitude",
    question: "4. Percentages\nTheory: Percent means per hundred.",
    example: "What is 25% of 240?"
  ),
  QuestionModell(
     id: "3",
    category: "Aptitude",
    question: "5. Profit and Loss\nTheory: Profit/Loss = Selling Price - Cost Price.",
    example: "An item bought for ₹250 is sold at ₹300. Find the profit percentage."
  ),
  QuestionModell(
     id: "3",
    category: "Aptitude",
    question: "6. Simple Interest\nTheory: SI = (P × R × T) / 100.",
    example: "What is the simple interest on ₹1000 at 5% for 2 years?"
  ),
  QuestionModell(
     id: "3",
    category: "Aptitude",
    question: "7. Averages\nTheory: Average = Sum of observations / Number of observations.",
    example: "Find the average of first 5 prime numbers."
  ),
  QuestionModell(
     id: "3",
    category: "Aptitude",
    question: "8. Number Series\nTheory: Identify the pattern and predict the next number.",
    example: "2, 4, 8, 16, ?"
  ),
  QuestionModell(
     id: "3",
    category: "Aptitude",
    question: "9. Mixtures and Alligation\nTheory: Used to find the ratio in which two or more ingredients are mixed.",
    example: "How many liters of a 30% alcohol solution should be mixed with 40 liters of a 50% solution to get a 40% solution?"
  ),
  QuestionModell(
     id: "3",
    category: "Aptitude",
    question: "10. Pipes and Cisterns\nTheory: If a pipe fills in x hours, then 1/x part is filled in 1 hour.",
    example: "Pipe A fills a tank in 4 hours, Pipe B in 6 hours. How long to fill the tank together?"
  ),

  // Reasoning
  QuestionModell(
     id: "3",
    category: "Reasoning",
    question: "1. Number Series\nTheory: Identify the pattern to find the missing number.",
    example: "2, 6, 12, 20, ?, 42"
  ),
  QuestionModell(
     id: "3",
    category: "Reasoning",
    question: "2. Coding-Decoding\nTheory: Letters or numbers are coded using a fixed pattern or logic.",
    example: "If CAT = DBU, then DOG = ?"
  ),
  QuestionModell(
     id: "3",
    category: "Reasoning",
    question: "3. Blood Relations\nTheory: Solve using family tree logic.",
    example: "Pointing to a photo, Rahul said, 'He is the son of my grandfather’s only son.' Who is the person in the photo?"
  ),
  QuestionModell(
     id: "3",
    category: "Reasoning",
    question: "4. Direction Sense\nTheory: Use compass direction rules to solve.",
    example: "A walks north, turns right, then left. Which direction is he facing?"
  ),
  QuestionModell(
     id: "3",
    category: "Reasoning",
    question: "5. Syllogism\nTheory: Use Venn diagrams to verify conclusions.",
    example: "All dogs are animals. Some animals are cats. Conclusion: Some dogs are cats?"
  ),
  QuestionModell(
     id: "3",
    category: "Reasoning",
    question: "6. Statement and Assumption\nTheory: Judge if the assumption logically follows.",
    example: "Statement: You must study to succeed.\nAssumption: Studying leads to success?"
  ),
  QuestionModell(
     id: "3",
    category: "Reasoning",
    question: "7. Puzzle Solving\nTheory: Use clues and elimination method.",
    example: "Four people A, B, C, D live on different floors. A above B, C below D. Who is on the top floor?"
  ),
  QuestionModell(
     id: "3",
    category: "Reasoning",
    question: "8. Logical Venn Diagrams\nTheory: Represent relationships visually using circles.",
    example: "Which diagram shows the relationship between doctors, men, and humans?"
  ),
  QuestionModell(
     id: "3",
    category: "Reasoning",
    question: "9. Analogy\nTheory: Based on similar relationships between words or numbers.",
    example: "Foot : Shoe :: Hand : ?"
  ),
  QuestionModell(
     id: "3",
    category: "Reasoning",
    question: "10. Odd One Out\nTheory: Identify the different one among the group.",
    example: "Circle, Square, Triangle, Rectangle, Tuesday"
  ),

  // Verbal
  QuestionModell(
     id: "3",
    category: "Verbal",
    question: "1. Reading Comprehension\nTheory: Tests interpretation and understanding of passages.",
    example: "Read the passage and answer: What is the main cause of global warming discussed in the passage?"
  ),
  QuestionModell(
    category: "Verbal",
     id: "3",
    question: "2. Sentence Correction/Error Spotting\nTheory: Identify and correct grammatical errors.",
    example: "Find the error: She go to school everyday."
  ),
  QuestionModell(
    category: "Verbal",
     id: "3",
    question: "3. Synonyms and Antonyms\nTheory: Find words with similar or opposite meanings.",
    example: "Choose the synonym of 'Brilliant':\n(a) Dull (b) Bright (c) Lazy (d) Weak"
  ),
  QuestionModell(
     id: "3",
    category: "Verbal",
    question: "4. Para Jumbles\nTheory: Rearranging sentences to form a meaningful paragraph.",
    example: "Arrange the following sentences logically:\nP: He was bored\nQ: He turned on the TV\nR: Nothing was interesting\nS: He switched it off"
  ),
  QuestionModell(
     id: "3",
    category: "Verbal",
    question: "5. Fill in the Blanks\nTheory: Tests vocabulary and grammar through contextual sentence completion.",
    example: "She ____ to the market every Sunday.\n(a) go (b) goes (c) gone (d) going"
  ),
  QuestionModell(
     id: "3",
    category: "Verbal",
    question: "6. Cloze Test\nTheory: Fill in blanks in a passage using appropriate words.",
    example: "It was a ___ day and we decided to go for a picnic.\n(a) rainy (b) bright (c) dark (d) lazy"
  ),
  QuestionModell(
     id: "3",
    category: "Verbal",
    question: "7. One Word Substitution\nTheory: Replace phrases with a single word.",
    example: "A person who speaks many languages: (a) Linguist (b) Translator (c) Interpreter (d) Polyglot"
  ),
  QuestionModell(
     id: "3",
    category: "Verbal",
    question: "8. Active and Passive Voice\nTheory: Transforming sentences from active to passive voice.",
    example: "Convert: He completed the project.\n→ The project was completed by him."
  ),
  QuestionModell(
     id: "3",
    category: "Verbal",
    question: "9. Direct and Indirect Speech\nTheory: Changing sentences from direct to indirect speech.",
    example: "Direct: He said, \"I am tired.\"\nIndirect: He said that he was tired."
  ),
  QuestionModell(
     id: "3",
    category: "Verbal",
    question: "10. Idioms and Phrases\nTheory: Understanding common idiomatic expressions.",
    example: "Meaning of 'Break the ice':\n(a) To start a conversation\n(b) To shatter something\n(c) To cause trouble\n(d) To relax"
  ),
];

// cse_mcq.dart
final List<Map<String, dynamic>> cseMcqData = [{
    "question": "Which data structure uses LIFO?",
    "options": ["Queue", "Stack", "Array", "Tree"],
    "answer": "Stack"
  },
  {
    "question": "Time complexity of binary search?",
    "options": ["O(n)", "O(log n)", "O(n log n)", "O(n^2)"],
    "answer": "O(log n)"
  },
  {
    "question": "Which sorting algorithm is best for nearly sorted data?",
    "options": ["Quick Sort", "Merge Sort", "Bubble Sort", "Insertion Sort"],
    "answer": "Insertion Sort"
  },
  {
    "question": "Which layer in OSI model is responsible for routing?",
    "options": ["Data Link", "Transport", "Network", "Session"],
    "answer": "Network"
  },
  {
    "question": "In DBMS, SQL stands for?",
    "options": ["Structured Query Language", "Simple Query Logic", "Sequential Query Language", "None"],
    "answer": "Structured Query Language"
  },
  {
    "question": "Which of the following is a NoSQL database?",
    "options": ["MySQL", "MongoDB", "PostgreSQL", "Oracle"],
    "answer": "MongoDB"
  },
  {
    "question": "Which protocol is used to send emails?",
    "options": ["SMTP", "FTP", "HTTP", "SNMP"],
    "answer": "SMTP"
  },
  {
    "question": "Which of the following is not a programming language?",
    "options": ["Python", "Java", "HTML", "C++"],
    "answer": "HTML"
  },
  {
    "question": "Which algorithm is used in operating system scheduling?",
    "options": ["FIFO", "Round Robin", "LRU", "All of these"],
    "answer": "All of these"
  },
  {
    "question": "What is the output of 3 & 4 in binary?",
    "options": ["0", "4", "2", "1"],
    "answer": "0"
  },
  {
    "question": "Which of these is a valid IP address?",
    "options": ["192.168.1.1", "256.100.1.1", "999.999.999.999", "192.168.300.1"],
    "answer": "192.168.1.1"
  },
  {
    "question": "Which keyword is used to inherit a class in Java?",
    "options": ["this", "super", "extends", "implements"],
    "answer": "extends"
  },
  {
    "question": "Which of the following is used for memory management?",
    "options": ["Scheduler", "Compiler", "Garbage Collector", "Loader"],
    "answer": "Garbage Collector"
  },
  {
    "question": "Which command is used to compile Java code?",
    "options": ["java", "javac", "compile", "jvm"],
    "answer": "javac"
  },
  {
    "question": "Which of these is a type of software testing?",
    "options": ["Unit Testing", "Modular Testing", "Security Testing", "All of the above"],
    "answer": "All of the above"
  },
  {
    "question": "TCP stands for?",
    "options": ["Transfer Control Protocol", "Transmission Control Protocol", "Transport Connection Protocol", "None"],
    "answer": "Transmission Control Protocol"
  },
  {
    "question": "Which of the following is NOT an OOP concept?",
    "options": ["Encapsulation", "Abstraction", "Polymorphism", "Compilation"],
    "answer": "Compilation"
  },
  {
    "question": "Which data structure uses FIFO?",
    "options": ["Stack", "Queue", "Tree", "Graph"],
    "answer": "Queue"
  },
  {
    "question": "HTML is used for?",
    "options": ["Designing", "Structuring web pages", "Programming", "Backend"],
    "answer": "Structuring web pages"
  },
  {
    "question": "DNS stands for?",
    "options": ["Domain Name System", "Data Network Server", "Dynamic Name Server", "None"],
    "answer": "Domain Name System"
  }];
final List<Map<String, dynamic>> eceMcqData = [{
    "question": "What is the unit of capacitance?",
    "options": ["Ohm", "Henry", "Farad", "Tesla"],
    "answer": "Farad"
  },
  {
    "question": "Which of the following is a unipolar device?",
    "options": ["BJT", "FET", "MOSFET", "UJT"],
    "answer": "UJT"
  },
  {
    "question": "Which material is commonly used in semiconductor devices?",
    "options": ["Copper", "Aluminum", "Silicon", "Iron"],
    "answer": "Silicon"
  },
  {
    "question": "What does LED stand for?",
    "options": ["Light Emitting Device", "Low Energy Device", "Light Emitting Diode", "Low Emitting Diode"],
    "answer": "Light Emitting Diode"
  },
  {
    "question": "Which modulation technique is used in AM radio?",
    "options": ["Frequency Modulation", "Amplitude Modulation", "Phase Modulation", "Pulse Modulation"],
    "answer": "Amplitude Modulation"
  },
  {
    "question": "Which law relates current, voltage, and resistance?",
    "options": ["Ohm's Law", "Kirchhoff's Law", "Faraday's Law", "Maxwell's Law"],
    "answer": "Ohm's Law"
  },
  {
    "question": "What is the function of a diode?",
    "options": ["Amplify signals", "Store charge", "Allow current in one direction", "Convert AC to DC"],
    "answer": "Allow current in one direction"
  },
  {
    "question": "Which filter blocks DC component?",
    "options": ["Low pass filter", "High pass filter", "Band pass filter", "Notch filter"],
    "answer": "High pass filter"
  },
  {
    "question": "In a BJT, the base is ________ doped.",
    "options": ["Heavily", "Moderately", "Lightly", "Undoped"],
    "answer": "Lightly"
  },
  {
    "question": "What is the typical bandwidth of FM signal?",
    "options": ["5 kHz", "75 kHz", "200 kHz", "2 MHz"],
    "answer": "200 kHz"
  },
  {
    "question": "Which device is used as a voltage regulator?",
    "options": ["Zener Diode", "LED", "SCR", "Tunnel Diode"],
    "answer": "Zener Diode"
  },
  {
    "question": "What is the main use of a transistor?",
    "options": ["Rectification", "Signal detection", "Amplification", "Voltage regulation"],
    "answer": "Amplification"
  },
  {
    "question": "Which law governs the induced EMF?",
    "options": ["Ampere's Law", "Lenz’s Law", "Faraday’s Law", "Kirchhoff's Law"],
    "answer": "Faraday’s Law"
  },
  {
    "question": "What is the output of a NOT gate if input is 1?",
    "options": ["0", "1", "X", "Undefined"],
    "answer": "0"
  },
  {
    "question": "Which of the following is not a logic gate?",
    "options": ["AND", "OR", "XOR", "AMP"],
    "answer": "AMP"
  },
  {
    "question": "Which parameter measures antenna efficiency?",
    "options": ["Bandwidth", "Gain", "VSWR", "Power"],
    "answer": "Gain"
  },
  {
    "question": "Which modulation technique is used in TV broadcasting?",
    "options": ["FM", "AM", "PM", "PWM"],
    "answer": "FM"
  },
  {
    "question": "Which layer of the OSI model deals with routing?",
    "options": ["Physical", "Data Link", "Network", "Transport"],
    "answer": "Network"
  },
  {
    "question": "Which IC is commonly used in digital circuits?",
    "options": ["555 Timer", "7805", "LM317", "LM386"],
    "answer": "555 Timer"
  },
  {
    "question": "Which communication uses satellites?",
    "options": ["LAN", "MAN", "WAN", "Satellite Communication"],
    "answer": "Satellite Communication"
  },
];
final List<Map<String, dynamic>> eeeMcqData = [
  {
    "question": "What is the unit of electric current?",
    "options": ["Volt", "Ohm", "Ampere", "Watt"],
    "answer": "Ampere"
  },
  {
    "question": "Which law states that the current is directly proportional to voltage?",
    "options": ["Ohm’s Law", "Kirchhoff’s Law", "Lenz’s Law", "Faraday’s Law"],
    "answer": "Ohm’s Law"
  },
  {
    "question": "Which of the following is an AC machine?",
    "options": ["DC Motor", "DC Generator", "Induction Motor", "Battery"],
    "answer": "Induction Motor"
  },
  {
    "question": "Which instrument measures electric current?",
    "options": ["Voltmeter", "Wattmeter", "Ammeter", "Multimeter"],
    "answer": "Ammeter"
  },
  {
    "question": "What is the frequency of standard AC supply in India?",
    "options": ["50 Hz", "60 Hz", "40 Hz", "45 Hz"],
    "answer": "50 Hz"
  },
  {
    "question": "Which component stores energy in the form of magnetic field?",
    "options": ["Capacitor", "Inductor", "Resistor", "Diode"],
    "answer": "Inductor"
  },
  {
    "question": "Which material is commonly used as a conductor?",
    "options": ["Wood", "Rubber", "Copper", "Plastic"],
    "answer": "Copper"
  },
  {
    "question": "Transformer works on the principle of ________.",
    "options": ["Ohm's Law", "Faraday’s Law", "Lenz’s Law", "Ampere’s Law"],
    "answer": "Faraday’s Law"
  },
  {
    "question": "A diode allows current to flow in how many directions?",
    "options": ["One", "Two", "Three", "None"],
    "answer": "One"
  },
  {
    "question": "The function of a fuse is to ________.",
    "options": ["Store energy", "Amplify signal", "Protect circuit", "Generate power"],
    "answer": "Protect circuit"
  },
  {
    "question": "Which device converts mechanical energy to electrical energy?",
    "options": ["Motor", "Transformer", "Generator", "Relay"],
    "answer": "Generator"
  },
  {
    "question": "Which of these is a step-up transformer used for?",
    "options": ["Reducing current", "Increasing voltage", "Decreasing voltage", "Increasing current"],
    "answer": "Increasing voltage"
  },
  {
    "question": "Which power plant has the least environmental impact?",
    "options": ["Thermal", "Nuclear", "Hydro", "Diesel"],
    "answer": "Hydro"
  },
  {
    "question": "What is the full form of LED?",
    "options": ["Low Emission Diode", "Light Emitting Device", "Light Emitting Diode", "Low Energy Display"],
    "answer": "Light Emitting Diode"
  },
  {
    "question": "What is the typical power factor of a purely resistive circuit?",
    "options": ["0", "1", "0.5", "Infinity"],
    "answer": "1"
  },
  {
    "question": "Which quantity does a resistor oppose?",
    "options": ["Voltage", "Current", "Power", "Frequency"],
    "answer": "Current"
  },
  {
    "question": "Which law is used for circuit loop analysis?",
    "options": ["Ohm's Law", "Kirchhoff's Voltage Law", "Lenz’s Law", "Faraday’s Law"],
    "answer": "Kirchhoff's Voltage Law"
  },
  {
    "question": "What is the main cause of energy loss in a transformer?",
    "options": ["Friction", "Radiation", "Hysteresis", "Sound"],
    "answer": "Hysteresis"
  },
  {
    "question": "Which motor is commonly used in ceiling fans?",
    "options": ["DC Motor", "Step Motor", "Universal Motor", "Single-phase Induction Motor"],
    "answer": "Single-phase Induction Motor"
  },
  {
    "question": "Which component converts AC to DC?",
    "options": ["Capacitor", "Inductor", "Rectifier", "Amplifier"],
    "answer": "Rectifier"
  },];
final List<Map<String, dynamic>> aimlMcqData = [{
    "question": "Which algorithm is used for classification?",
    "options": ["KNN", "K-Means", "Apriori", "PCA"],
    "answer": "KNN"
  },
  {
    "question": "What does AI stand for?",
    "options": ["Artificial Interface", "Automated Intelligence", "Artificial Intelligence", "Advanced Integration"],
    "answer": "Artificial Intelligence"
  },
  {
    "question": "Which is a supervised learning algorithm?",
    "options": ["Linear Regression", "K-Means", "DBSCAN", "Apriori"],
    "answer": "Linear Regression"
  },
  {
    "question": "Which of these is an unsupervised learning algorithm?",
    "options": ["Logistic Regression", "Decision Tree", "K-Means", "Naive Bayes"],
    "answer": "K-Means"
  },
  {
    "question": "Which library is used in Python for ML?",
    "options": ["NumPy", "Matplotlib", "Scikit-learn", "Tkinter"],
    "answer": "Scikit-learn"
  },
  {
    "question": "What does NLP stand for?",
    "options": ["Natural Language Processing", "Neural Logic Processing", "Numeric Logical Processing", "None"],
    "answer": "Natural Language Processing"
  },
  {
    "question": "Which technique reduces overfitting?",
    "options": ["Underfitting", "Dropout", "Overtraining", "Gradient Clipping"],
    "answer": "Dropout"
  },
  {
    "question": "Which is used to reduce dimensionality?",
    "options": ["CNN", "RNN", "PCA", "SVM"],
    "answer": "PCA"
  },
  {
    "question": "What is the output of classification?",
    "options": ["Categories", "Numbers", "Text", "Graphs"],
    "answer": "Categories"
  },
  {
    "question": "Which one is a deep learning library?",
    "options": ["TensorFlow", "Pandas", "Matplotlib", "Seaborn"],
    "answer": "TensorFlow"
  },
  {
    "question": "ReLU stands for?",
    "options": ["Rectified Linear Unit", "Regularized Learning Unit", "Random Loss Unit", "Reduced Linear Unit"],
    "answer": "Rectified Linear Unit"
  },
  {
    "question": "Which activation function outputs 0 or 1?",
    "options": ["Sigmoid", "ReLU", "Tanh", "Softmax"],
    "answer": "Sigmoid"
  },
  {
    "question": "Which metric is used for regression?",
    "options": ["Accuracy", "F1-score", "MAE", "Recall"],
    "answer": "MAE"
  },
  {
    "question": "Which algorithm is used for recommendation systems?",
    "options": ["Collaborative Filtering", "Logistic Regression", "CNN", "KNN"],
    "answer": "Collaborative Filtering"
  },
  {
    "question": "Which is not an AI goal?",
    "options": ["Understanding", "Reasoning", "Perception", "Compiling"],
    "answer": "Compiling"
  },
  {
    "question": "Which one is not a type of ML?",
    "options": ["Supervised", "Unsupervised", "Reinforcement", "Transductive"],
    "answer": "Transductive"
  },
  {
    "question": "Which is a reinforcement learning algorithm?",
    "options": ["Q-Learning", "KNN", "Naive Bayes", "SVM"],
    "answer": "Q-Learning"
  },
  {
    "question": "Neurons in neural networks are inspired by?",
    "options": ["Brain", "Eyes", "Ears", "Heart"],
    "answer": "Brain"
  },
  {
    "question": "Which loss is used for classification?",
    "options": ["Cross Entropy", "MSE", "Huber", "MAE"],
    "answer": "Cross Entropy"
  },
  {
    "question": "Backpropagation is used in?",
    "options": ["Training Neural Networks", "Preprocessing", "Testing Models", "Feature Selection"],
    "answer": "Training Neural Networks"
  },];
final List<Map<String, dynamic>> dsMcqData = [{
    "question": "What is the primary goal of data science?",
    "options": ["Create websites", "Analyze and interpret complex data", "Manage databases", "Design algorithms"],
    "answer": "Analyze and interpret complex data"
  },
  {
    "question": "Which language is most widely used for data science?",
    "options": ["Java", "Python", "C++", "Ruby"],
    "answer": "Python"
  },
  {
    "question": "Which library is used for data manipulation in Python?",
    "options": ["Seaborn", "TensorFlow", "Pandas", "Scikit-learn"],
    "answer": "Pandas"
  },
  {
    "question": "Which of the following is used for data visualization?",
    "options": ["NumPy", "Pandas", "Matplotlib", "TensorFlow"],
    "answer": "Matplotlib"
  },
  {
    "question": "What does CSV stand for?",
    "options": ["Comma Separated Values", "Character Structured Values", "Comma System Values", "Control Separated Variables"],
    "answer": "Comma Separated Values"
  },
  {
    "question": "What is the full form of SQL?",
    "options": ["Structured Question Language", "Simple Query Language", "Structured Query Language", "System Query Logic"],
    "answer": "Structured Query Language"
  },
  {
    "question": "Which of the following is NOT a type of data?",
    "options": ["Structured", "Unstructured", "Semi-structured", "Unrelated"],
    "answer": "Unrelated"
  },
  {
    "question": "Which statistic shows the spread of the data?",
    "options": ["Mean", "Median", "Mode", "Standard Deviation"],
    "answer": "Standard Deviation"
  },
  {
    "question": "Which algorithm is best for classification?",
    "options": ["Linear Regression", "KNN", "K-Means", "PCA"],
    "answer": "KNN"
  },
  {
    "question": "Which metric is used for regression problems?",
    "options": ["Accuracy", "MAE", "F1 Score", "Recall"],
    "answer": "MAE"
  },
  {
    "question": "Which chart is best for categorical data?",
    "options": ["Line chart", "Histogram", "Bar chart", "Scatter plot"],
    "answer": "Bar chart"
  },
  {
    "question": "Which of these is a dimensionality reduction technique?",
    "options": ["PCA", "KNN", "CNN", "Random Forest"],
    "answer": "PCA"
  },
  {
    "question": "What is overfitting?",
    "options": ["Model performs well on new data", "Model performs well on training data but poorly on new data", "Model never trains", "Model is too simple"],
    "answer": "Model performs well on training data but poorly on new data"
  },
  {
    "question": "Which method is used to handle missing data?",
    "options": ["Drop rows", "Fill with mean", "Fill with median", "All of the above"],
    "answer": "All of the above"
  },
  {
    "question": "Which of these is a classification algorithm?",
    "options": ["Logistic Regression", "Linear Regression", "K-Means", "PCA"],
    "answer": "Logistic Regression"
  },
  {
    "question": "Which package is used for machine learning in Python?",
    "options": ["Scikit-learn", "BeautifulSoup", "Tkinter", "Flask"],
    "answer": "Scikit-learn"
  },
  {
    "question": "Which term refers to the number of independent variables in a dataset?",
    "options": ["Features", "Labels", "Targets", "Samples"],
    "answer": "Features"
  },
  {
    "question": "Which term refers to the dependent variable?",
    "options": ["Feature", "Target", "Noise", "Attribute"],
    "answer": "Target"
  },
  {
    "question": "What is the purpose of EDA?",
    "options": ["Build models", "Clean data", "Explore data and find patterns", "Deploy models"],
    "answer": "Explore data and find patterns"
  },
  {
    "question": "Which tool is used to create dashboards in data science?",
    "options": ["Jupyter Notebook", "TensorFlow", "Power BI", "Pandas"],
    "answer": "Power BI"
  },];
final List<Map<String, dynamic>> mechMcqData = [{
    "question": "Which law states that pressure is transmitted equally in all directions?",
    "options": ["Boyle's Law", "Pascal’s Law", "Newton’s Law", "Bernoulli’s Principle"],
    "answer": "Pascal’s Law"
  },
  {
    "question": "What is the unit of force?",
    "options": ["Newton", "Joule", "Watt", "Pascal"],
    "answer": "Newton"
  },
  {
    "question": "Which cycle is used in internal combustion engines?",
    "options": ["Otto cycle", "Carnot cycle", "Rankine cycle", "Brayton cycle"],
    "answer": "Otto cycle"
  },
  {
    "question": "Which of the following is not a thermodynamic process?",
    "options": ["Isobaric", "Isothermal", "Isochoric", "Isomagnetic"],
    "answer": "Isomagnetic"
  },
  {
    "question": "Which tool is used to measure angle?",
    "options": ["Vernier caliper", "Micrometer", "Protractor", "Screw gauge"],
    "answer": "Protractor"
  },
  {
    "question": "The mechanical advantage of a machine is the ratio of ________.",
    "options": ["Load to effort", "Effort to load", "Distance moved by load to effort", "Speed to torque"],
    "answer": "Load to effort"
  },
  {
    "question": "What does CNC stand for?",
    "options": ["Control Numeric Code", "Computer Numerical Control", "Central Network Code", "Core Numeric Circuit"],
    "answer": "Computer Numerical Control"
  },
  {
    "question": "Which metal is used in making aircrafts due to its lightweight?",
    "options": ["Iron", "Copper", "Aluminum", "Lead"],
    "answer": "Aluminum"
  },
  {
    "question": "Which instrument measures surface roughness?",
    "options": ["Tachometer", "Roughness tester", "Strain gauge", "Micrometer"],
    "answer": "Roughness tester"
  },
  {
    "question": "The hardness of a material is tested using ________.",
    "options": ["Creep test", "Brinell test", "Fatigue test", "Compression test"],
    "answer": "Brinell test"
  },
  {
    "question": "Which bearing has least friction?",
    "options": ["Ball bearing", "Roller bearing", "Plain bearing", "Journal bearing"],
    "answer": "Ball bearing"
  },
  {
    "question": "Which property resists deformation?",
    "options": ["Hardness", "Stiffness", "Elasticity", "Plasticity"],
    "answer": "Stiffness"
  },
  {
    "question": "What is the function of a flywheel?",
    "options": ["Control speed variations", "Store fuel", "Lubricate engine", "Start the engine"],
    "answer": "Control speed variations"
  },
  {
    "question": "A four-stroke engine completes a power stroke every ______ revolutions.",
    "options": ["1", "2", "3", "4"],
    "answer": "2"
  },
  {
    "question": "Which welding process uses a non-consumable electrode?",
    "options": ["MIG", "TIG", "Gas welding", "Arc welding"],
    "answer": "TIG"
  },
  {
    "question": "The stress-strain curve for mild steel is ________.",
    "options": ["Linear", "Non-linear", "Parabolic", "Exponential"],
    "answer": "Non-linear"
  },
  {
    "question": "What does the first law of thermodynamics state?",
    "options": ["Energy can’t be created or destroyed", "Heat flows from cold to hot", "Entropy increases", "Mass remains constant"],
    "answer": "Energy can’t be created or destroyed"
  },
  {
    "question": "Which device is used to measure temperature?",
    "options": ["Barometer", "Hygrometer", "Thermometer", "Manometer"],
    "answer": "Thermometer"
  },
  {
    "question": "What does CAD stand for?",
    "options": ["Computed Axial Drawing", "Computer Aided Design", "Common Axis Diagram", "Circular Arc Drawing"],
    "answer": "Computer Aided Design"
  },
  {
    "question": "Which of the following is a non-ferrous metal?",
    "options": ["Steel", "Iron", "Aluminum", "Wrought iron"],
    "answer": "Aluminum"
  },];
final List<Map<String, dynamic>> civilMcqData = [{
    "question": "Which cement is used in underwater construction?",
    "options": ["Quick setting", "Portland", "Pozzolana", "Sulphate resistant"],
    "answer": "Quick setting"
  },
  {
    "question": "What is the standard size of a brick in India?",
    "options": ["190x90x90 mm", "200x100x100 mm", "210x110x110 mm", "220x110x70 mm"],
    "answer": "190x90x90 mm"
  },
  {
    "question": "What is the minimum grade of concrete for RCC?",
    "options": ["M5", "M10", "M15", "M20"],
    "answer": "M20"
  },
  {
    "question": "Which test is used for checking the strength of cement?",
    "options": ["Soundness Test", "Compressive Strength Test", "Fineness Test", "Consistency Test"],
    "answer": "Compressive Strength Test"
  },
  {
    "question": "Which is used to determine the workability of concrete?",
    "options": ["Slump test", "Tensile test", "Impact test", "Creep test"],
    "answer": "Slump test"
  },
  {
    "question": "Which foundation is suitable for black cotton soil?",
    "options": ["Pile foundation", "Raft foundation", "Mat foundation", "Grillage foundation"],
    "answer": "Pile foundation"
  },
  {
    "question": "Which instrument is used for leveling?",
    "options": ["Theodolite", "Compass", "Dumpy Level", "Tacheometer"],
    "answer": "Dumpy Level"
  },
  {
    "question": "Which material has the highest compressive strength?",
    "options": ["Cement mortar", "Brick", "Concrete", "Steel"],
    "answer": "Steel"
  },
  {
    "question": "Which of the following is a non-destructive test?",
    "options": ["Core cutting", "Ultrasonic pulse velocity", "Rebound hammer", "Both b and c"],
    "answer": "Both b and c"
  },
  {
    "question": "Which code is used for general construction in India?",
    "options": ["IS 456", "IS 800", "IS 875", "IS 1893"],
    "answer": "IS 456"
  },
  {
    "question": "What does FSI stand for?",
    "options": ["Floor Space Index", "Field Strength Index", "Foundation Soil Index", "Forming Structural Index"],
    "answer": "Floor Space Index"
  },
  {
    "question": "Which of these is a good binding material?",
    "options": ["Cement", "Sand", "Aggregate", "Water"],
    "answer": "Cement"
  },
  {
    "question": "Which one is a compression member?",
    "options": ["Beam", "Slab", "Column", "Footing"],
    "answer": "Column"
  },
  {
    "question": "Which is used to check verticality?",
    "options": ["Plumb bob", "Spirit level", "Compass", "Steel tape"],
    "answer": "Plumb bob"
  },
  {
    "question": "Which of the following increases concrete strength?",
    "options": ["Water", "Cement", "Aggregate", "Admixture"],
    "answer": "Admixture"
  },
  {
    "question": "What is the initial setting time of cement?",
    "options": ["30 minutes", "45 minutes", "60 minutes", "90 minutes"],
    "answer": "30 minutes"
  },
  {
    "question": "What is the full form of BBS?",
    "options": ["Bar Bending Schedule", "Beam Bending Schedule", "Brick Bond System", "Beam Bar System"],
    "answer": "Bar Bending Schedule"
  },
  {
    "question": "Which admixture is used for waterproofing?",
    "options": ["Plasticizer", "Accelerator", "Waterproofing agent", "Retarder"],
    "answer": "Waterproofing agent"
  },
  {
    "question": "Which is the most durable stone?",
    "options": ["Granite", "Marble", "Limestone", "Sandstone"],
    "answer": "Granite"
  },
  {
    "question": "What is the unit of measurement for steel?",
    "options": ["kg", "ton", "cubic meter", "meter"],
    "answer": "kg"
  },];





// sample_topic_data.dart
final List<TopicModel> topicList = [
  TopicModel(
    title: 'Current Affairs & Economy',
    topics: [
      'Climate change & its global implications',
      'Impact of cryptocurrency on traditional finance',
      'Falling rupee’s impact on the Indian economy',
      'G20 Summit — Relevance in today’s world',
      'Impact of Brexit on India',
      'Universal Basic Income – Pros & Cons',
      'Fintech firms & banks – Collaboration or Competition?',
      'Aadhaar – Should it be mandatory?',
      'Flipkart‑Walmart deal – Impact on Indian retail sector',
      'Public sector bank privatization – Boon or Bane?',
      'Minimum Support Price (MSP) for farmers – Effective or not?',
      'Falling fuel prices – Causes & Effects',
      'Insolvency and Bankruptcy Code – Impact on businesses',
      'Plastic money – Benefits vs Drawbacks',
      'Surrogacy Regulation Bill – Ethical and legal aspects',
    ],
  ),
  TopicModel(
    title: 'Technology & Innovation',
    topics: [
      'Will AI replace humans in the future?',
      'Impact of technology on employment',
      'Blockchain – Advantages and Challenges',
      'Is India ready for 5G?',
      'Industrial Revolution 4.0 – India’s position',
      'Innovations in Healthcare – A post-pandemic perspective',
      'Cybersecurity and Data Privacy – Are we doing enough?',
      'Generative AI – Ethical and Legal Dilemmas',
      'Autonomous Vehicles – Safety and Ethics',
      'Smart Materials and Nanotechnology – Future of industry?',
    ],
  ),
  TopicModel(
    title: 'Social & Ethical Issues',
    topics: [
      'Gender equality at the workplace – Myth or Reality?',
      'Rising crimes against women – Role of law & society',
      'Caste-based reservation – Still relevant today?',
      'Environmental conservation vs industrial progress',
      'Mental illness in India – Awareness and stigma',
      'Migration and refugee crises – India’s role',
      'Media censorship – Necessary or violation of freedom?',
      'Should organ donation be made compulsory?',
      '#MeToo campaign – A tool for justice or misuse?',
      'Is working for MNCs a form of modern slavery?',
    ],
  ),
  TopicModel(
    title: 'Abstract & Thought-Provoking Topics',
    topics: [
      'Hard work vs Smart work – What works better?',
      'Money vs Happiness – What defines success?',
      'Famous vs Important – What matters more?',
      'Red is red, blue is blue – Interpret your way',
      'Zero (0) – Significance in life and tech',
      'Dot – A metaphorical exploration',
      'Blood is thicker than water – Agree or Disagree?',
      'Brevity is the soul of wit – Is less more?',
      'Innovation vs Invention – What drives progress?',
      'Roots & Wings – The balance between tradition and ambition',
    ],
  ),
  TopicModel(
    title: 'Business, Leadership & Personal Development',
    topics: [
      'Startups vs Corporate jobs – Which is better?',
      'Is an MBA essential for business success?',
      'Role of youth in nation-building',
      'Work-life balance – Myth or Reality?',
      'Soft skills vs Technical skills – Which matter more in a job?',
    ],
  ),
];

final List<HrQuestionModel> hrQuestions = [
  HrQuestionModel(
    question: '1. Tell me about yourself.',
    answer: "I'm a computer science graduate with a strong interest in cloud computing and app development. I've worked on several academic and personal projects, and I'm passionate about continuous learning and problem-solving.",
  ),
  HrQuestionModel(
    question: '2. Why do you want to work here?',
    answer: "Your company stands out for innovation and employee development. I’m excited by your projects and believe my skills align well with your mission.",
  ),
  HrQuestionModel(
    question: '3. What are your strengths?',
    answer: "I’m a quick learner, good team player, and highly organized. I also adapt quickly to new technologies.",
  ),
  HrQuestionModel(
    question: '4. What is your weakness?',
    answer: "I used to focus too much on details, but I’ve learned to balance quality with deadlines through prioritization.",
  ),
  HrQuestionModel(
    question: '5. Where do you see yourself in 5 years?',
    answer: "I see myself in a leadership role, contributing to impactful projects and mentoring juniors.",
  ),
  HrQuestionModel(
    question: '6. Why should we hire you?',
    answer: "I bring a blend of technical skills, enthusiasm, and a proactive mindset. I’m ready to contribute from day one.",
  ),
  HrQuestionModel(
    question: '7. Tell me about a challenge you faced and how you overcame it.',
    answer: "In a group project, we faced coordination issues. I suggested regular short meetings which helped align the team and meet the deadline.",
  ),
  HrQuestionModel(
    question: '8. Are you willing to relocate?',
    answer: "Yes, I’m open to relocation for the right opportunity.",
  ),
  HrQuestionModel(
    question: '9. Are you comfortable working night shifts or weekends?',
    answer: "Yes, if the role requires it, I’m flexible with timings.",
  ),
  HrQuestionModel(
    question: '10. What motivates you?',
    answer: "Solving problems, learning new things, and achieving goals keep me motivated.",
  ),
  HrQuestionModel(
    question: '11. Describe your ideal work environment.',
    answer: "A collaborative, supportive, and innovative environment with growth opportunities.",
  ),
  HrQuestionModel(
    question: '12. How do you handle stress?',
    answer: "I break tasks into smaller parts, prioritize, and stay calm under pressure.",
  ),
  HrQuestionModel(
    question: '13. What are your salary expectations?',
    answer: "I'm open to a fair offer based on the industry standards and my skills.",
  ),
  HrQuestionModel(
    question: '14. What do you know about our company?',
    answer: "You are a leader in your industry, known for innovation and strong company culture.",
  ),
  HrQuestionModel(
    question: '15. Why did you leave your last job?',
    answer: "I’m looking for growth opportunities and to expand my skill set in a more dynamic environment.",
  ),
  HrQuestionModel(
    question: '16. How do you prioritize your work?',
    answer: "I list tasks by urgency and importance, then allocate time accordingly.",
  ),
  HrQuestionModel(
    question: '17. Describe yourself in one word.',
    answer: "Reliable.",
  ),
  HrQuestionModel(
    question: '18. Do you prefer working alone or in a team?',
    answer: "I’m comfortable with both, but I enjoy teamwork for idea-sharing and collaboration.",
  ),
  HrQuestionModel(
    question: '19. How do you handle feedback?',
    answer: "I welcome feedback as a tool for growth and improvement.",
  ),
  HrQuestionModel(
    question: '20. Tell me about your leadership experience.',
    answer: "I led a team of 4 during a final-year project, delegating tasks and ensuring timely delivery.",
  ),
  HrQuestionModel(
    question: '21. What are your career goals?',
    answer: "To become a subject-matter expert and take on more responsibility in tech leadership roles.",
  ),
  HrQuestionModel(
    question: '22. Describe a time you failed.',
    answer: "Once, I missed a deadline due to poor estimation. I learned to plan better and buffer time for reviews.",
  ),
  HrQuestionModel(
    question: '23. How do you handle conflict in a team?',
    answer: "I listen to both sides calmly, encourage open communication, and work towards a solution.",
  ),
  HrQuestionModel(
    question: '24. What makes you unique?',
    answer: "My blend of technical skill, creativity, and empathy makes me a well-rounded contributor.",
  ),
  HrQuestionModel(
    question: '25. What do you do outside of work?',
    answer: "I enjoy reading, fitness, and working on personal coding projects.",
  ),
  HrQuestionModel(
    question: '26. Are you applying to other companies?',
    answer: "Yes, I’m exploring options but your company is one of my top choices.",
  ),
  HrQuestionModel(
    question: '27. How soon can you join?',
    answer: "I can join immediately / after serving my notice period (as applicable).",
  ),
  HrQuestionModel(
    question: '28. What do you expect from a manager?',
    answer: "Clear communication, constructive feedback, and support for growth.",
  ),
  HrQuestionModel(
    question: '29. What will you do if you’re not selected?',
    answer: "I’ll take the experience positively, work on my areas of improvement, and keep applying.",
  ),
  HrQuestionModel(
    question: '30. How do you define success?',
    answer: "Achieving goals while growing personally and professionally.",
  ),
  HrQuestionModel(
    question: '31. What do you value more – work or money?',
    answer: "Work, because meaningful work leads to long-term rewards.",
  ),
  HrQuestionModel(
    question: '32. How do you manage deadlines?',
    answer: "I plan ahead, break tasks into milestones, and regularly track progress.",
  ),
  HrQuestionModel(
    question: '33. Tell me about a time you went above and beyond.',
    answer: "During a college fest, I stayed late to help finish a project that wasn’t mine to ensure the event's success.",
  ),
  HrQuestionModel(
    question: '34. How do you stay updated with technology?',
    answer: "I follow tech blogs, attend webinars, and experiment with new tools.",
  ),
  HrQuestionModel(
    question: '35. Have you ever had a conflict with a boss?',
    answer: "Not serious ones. I believe in resolving misunderstandings through open communication.",
  ),
  HrQuestionModel(
    question: '36. What kind of work culture are you looking for?',
    answer: "One that values innovation, collaboration, and continuous learning.",
  ),
  HrQuestionModel(
    question: '37. Do you consider yourself successful?',
    answer: "Yes, I’ve achieved several goals so far, and I’m excited for what’s next.",
  ),
  HrQuestionModel(
    question: '38. Can you work under pressure?',
    answer: "Yes, I stay calm, focus on the task, and deliver quality results.",
  ),
  HrQuestionModel(
    question: '39. What are your hobbies?',
    answer: "I like coding, reading tech blogs, and playing badminton.",
  ),
  HrQuestionModel(
    question: '40. Do you have any questions for me?',
    answer: "Yes, can you tell me more about the team I’ll be working with and growth opportunities here?",
  ),
];


final List<ManagerialQuestionModel> managerialQuestions = [
  ManagerialQuestionModel(
    question: '1. Tell me about a time you led a team. What was the outcome?',
    answer: 'I led a team for a college project with tight deadlines. I delegated tasks based on strengths, and we successfully delivered the project on time with high grades.',
  ),
  ManagerialQuestionModel(
    question: '2. How do you handle conflicts within a team?',
    answer: 'I listen to both parties, understand their views, and facilitate a solution that aligns with team goals.',
  ),
  ManagerialQuestionModel(
    question: '3. Have you ever had to make a tough decision under pressure?',
    answer: 'Yes, during a hackathon, I had to pivot the project idea due to technical issues. The decision helped us complete on time.',
  ),
  ManagerialQuestionModel(
    question: '4. How do you prioritize multiple tasks or projects with tight deadlines?',
    answer: 'I use a priority matrix and time-blocking method to handle high-impact tasks first.',
  ),
  ManagerialQuestionModel(
    question: '5. Describe a situation where you failed as a leader. What did you learn?',
    answer: 'I once micromanaged too much and it delayed progress. I learned to trust the team and delegate better.',
  ),
  ManagerialQuestionModel(
    question: '6. How do you motivate your team during difficult times?',
    answer: 'By recognizing efforts, setting clear short-term goals, and encouraging collaboration.',
  ),
  ManagerialQuestionModel(
    question: '7. Have you ever disagreed with your manager? How did you handle it?',
    answer: 'Yes, I respectfully presented data to support my perspective, and we reached a mutual understanding.',
  ),
  ManagerialQuestionModel(
    question: '8. How do you deal with underperforming team members?',
    answer: 'I understand their challenges, offer support or mentoring, and set clear performance expectations.',
  ),
  ManagerialQuestionModel(
    question: '9. What’s your management style?',
    answer: 'I follow a collaborative and adaptive style, depending on team maturity and project needs.',
  ),
  ManagerialQuestionModel(
    question: '10. How do you ensure your team stays productive and focused?',
    answer: 'By setting clear goals, tracking progress, and having regular check-ins.',
  ),
  ManagerialQuestionModel(
    question: '11. Describe a time when you had to adapt quickly to change.',
    answer: 'During an internship, the project scope changed. I quickly reallocated resources and adjusted the timeline.',
  ),
  ManagerialQuestionModel(
    question: '12. How do you handle stress and pressure in a managerial role?',
    answer: 'I stay organized, break tasks into steps, and stay calm under pressure to guide my team.',
  ),
  ManagerialQuestionModel(
    question: '13. How do you manage stakeholders with conflicting interests?',
    answer: 'I align everyone to a common goal, communicate transparently, and offer compromises.',
  ),
  ManagerialQuestionModel(
    question: '14. Have you handled a project with limited resources? How?',
    answer: 'Yes, I prioritized core functionalities and reused components efficiently.',
  ),
  ManagerialQuestionModel(
    question: '15. Tell me about a time when your team failed to deliver. What did you do?',
    answer: 'I took responsibility, analyzed the gaps, and implemented a better tracking process for the future.',
  ),
  ManagerialQuestionModel(
    question: '16. How do you build trust with your team?',
    answer: 'By being honest, consistent, and supporting their growth.',
  ),
  ManagerialQuestionModel(
    question: '17. How do you communicate goals and expectations to your team?',
    answer: 'I set SMART goals and regularly communicate updates and feedback.',
  ),
  ManagerialQuestionModel(
    question: '18. What steps do you take to improve team performance continuously?',
    answer: 'Regular retrospectives, upskilling opportunities, and performance reviews.',
  ),
  ManagerialQuestionModel(
    question: '19. How do you handle decision-making when data is limited?',
    answer: 'I use past experience, discuss with peers, and choose the most logical option with least risk.',
  ),
  ManagerialQuestionModel(
    question: '20. Where do you see yourself as a leader in 5 years?',
    answer: 'I aim to lead cross-functional teams and contribute to strategic decision-making.',
  ),
];
