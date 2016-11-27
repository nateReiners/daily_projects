class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next, @next.prev = @next, prev
  end
end

class LinkedList
  attr_reader :head
  include Enumerable

  def initialize
    @head = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    current_node = @head
    until current_node.next.nil?
      current_node = current_node.next
    end
    current_node
  end

  def empty?
    @head.next.nil?
  end

  def get(key)
    find_node(key).val #if current_node.key == key
  rescue ArgumentError
    nil
  end

  def include?(key)
    find_node(key)
    true
  rescue
    false
  end

  def append(key, val)
    new_node = Link.new(key, val)

    last_node = last
    new_node.prev = last_node
    last_node.next = new_node

  end

  def update(key, val)
    node = find_node(key)
    node.val = val
  rescue
    puts "The key #{key} is not set"
  end

  def remove(key)
    find_node(key).remove
  rescue
    puts "The key #{key} is not set"
  end

  def each(&prc)
    current_node = first
    until current_node == nil
      yield(current_node)
      current_node = current_node.next
    end
  end

  private

  def find_node(key)
    current_node = @head
    until (current_node.key == key)
      raise ArgumentError, "Invalid Key!" if current_node.next.nil?
      current_node = current_node.next
    end

    return current_node
  end

  #uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
