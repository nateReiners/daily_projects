require_relative 'p02_hashing'
require_relative 'p01_int_set'

class HashSet < ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    super(hash(key))
  end

  def include?(key)
    super(hash(key))
  end

  def remove(key)
    super(hash(key))
  end

  private

  def hash(key)
    key.hash
  end
end
