import Foundation

/*
 Given a linked list, rotate the list to the right by k places, where k is non-negative.

 Example 1:

 Input: 1->2->3->4->5->NULL, k = 2
 Output: 4->5->1->2->3->NULL
 Explanation:
 rotate 1 steps to the right: 5->1->2->3->4->NULL
 rotate 2 steps to the right: 4->5->1->2->3->NULL
 Example 2:

 Input: 0->1->2->NULL, k = 4
 Output: 2->0->1->NULL
 Explanation:
 rotate 1 steps to the right: 2->0->1->NULL
 rotate 2 steps to the right: 1->2->0->NULL
 rotate 3 steps to the right: 0->1->2->NULL
 rotate 4 steps to the right: 2->0->1->NULL
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {
            return head
        }
        // To get length of list
        var length = 1
        // To find tail of list
        var tail : ListNode? = head
        
        while tail?.next !=  nil {
            length += 1
            tail = tail?.next
        }
        // if K == length in that case we have to rotate entire list to return same original list
        var k =  k % length
        if k == 0 {
            return head
        }
        
        // Steps to find new head will be length - k
        var stepsToNewHead = length - k
        
        // Connet Tail to head to form cycle list
        tail?.next = head
        
        // Find New tail after rotating stepsToNewHead th time
        var newTail = tail
        
        while stepsToNewHead > 0 {
            stepsToNewHead -= 1
            newTail = newTail?.next
        }
        // New head
        let newHead = newTail?.next
        // Break cycle
        newTail?.next = nil
        
        return newHead
    }
}
