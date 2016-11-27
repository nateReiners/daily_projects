class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max + 1) { false }
  end

  def insert(num)
    @store[num] = true if is_valid?(num)
  end

  def remove(num)
    @store[num] = false if is_valid?(num)
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    validity = (num <= @max && num >= 0)
    raise "Out of bounds" unless validity
    validity
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless include?(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet < IntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    super(num)
    @count += 1 #unless include?(num)
    resize! if @count >= num_buckets - 1
  end

  def remove(num)
    @count -= 1 if include?(num)
    super(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_bucket_num = num_buckets * 2
    new_store = Array.new(new_bucket_num) { [] }
    old_vals = @store.flatten
    @store = new_store
    @count = 0
    old_vals.each do |val|
      insert(val)
    end
  end
end
