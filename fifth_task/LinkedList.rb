require_relative 'Node'

class LinkedList
  def initialize
    @head = nil
  end

  def find_before(value)
    node = @head
    return false unless node.next
    return node if node.next.value == value
    while (node = node.next)
      return node if node.next && node.next.value == value
    end
  end

  def find_tail
    node = @head
    return node unless node.next
    return node unless node.next while (node = node.next)
  end

  def append(value)
    if @head
      find_tail.next = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  def append_after(target, value)
    node = find(target)
    return unless node
    old_next = node.next
    node.next = Node.new(value)
    node.next.next = old_next
  end

  def find(value)
    node = @head
    return nil unless node.next
    return node if node.value == value
    while (node = node.next)
      return node if node.value == value
    end
  end

  def delete(value)
    if @head.value == value
      @head = @head.next
      return
    end
    node = find_before(value)
    node.next = node.next.next
  end

  def to_s
    result = []
    current = @head
    while current.next != nil
      result.append(current.value)
      current = current.next
    end
    result.append(current.value)
    "(#{result.to_s})".gsub(/"|\[|\]/,'')
  end
end