class StaticArray
  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    @store[i]
  end

  def []=(i, val)
    validate!(i)
    @store[i] = val
  end

  def length
    @store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, @store.length - 1)
  end
end

class DynamicArray
  attr_reader :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    @store[i] if i < @store.length
  end

  def []=(i, val)
    @store[i] = val
  rescue
    resize!
    retry
  end

  def capacity
    @store.length
  end

  def include?(val)
  end

  def push(val)
    resize! if full?
    @store[@count] = val
    @count += 1
  end

  def unshift(val)
    resize! if full?
    @count.downto(1) { |i| @store[i] = @store[i - 1] }
    @store[0] = val
    @count += 1
  end

  def pop
    return nil if @count.zero?
    @count -= 1
    return_val = @store[@count]
    @store[@count] = nil
    return_val
  end

  def shift
  end

  def first
  end

  def last
  end

  def each
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private
  def full?
    count >= @store.length
  end

  def resize!
    p "tried to resize"
  end
end

arr = DynamicArray.new(3)
p arr
arr.push(1)
arr.push(2)
arr.unshift(0)
p arr
