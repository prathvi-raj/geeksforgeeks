import Foundation

/*
 
 Reverse a singly linked list.

 Example:

 Input: 1->2->3->4->5->NULL
 Output: 5->4->3->2->1->NULL
 Follow up:

 A linked list can be reversed either iteratively or recursively. Could you implement both?
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        var current: ListNode? = head
        var previous: ListNode? = nil
        while current != nil {
            let next = current?.next
            current?.next = previous
            previous = current
            current = next
        }
        return previous
    }
}
