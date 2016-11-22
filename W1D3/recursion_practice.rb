require 'byebug'

def range(start, tail)
  return [] if start > tail
  range(start, tail - 1) + [tail]
end

# p range(4, 9)

def exponentiation(base, power)
  return 1 if power == 0
  smaller_exponent = power - 1
  base * exponentiation(base, smaller_exponent)
end

# p exponentiation(3, 3)

def exponentiation_2(base, power)
  return 1 if power == 0
  smaller_exponent = power / 2
  2 ** exponentiation_2(base, smaller_exponent)
end

# p exponentiation_2(2, 4)

def deep_dup(arr)
  arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
end


def fibonacci(n)
  return [0, 1].take(n) if n <= 2

  fibs = fibonacci(n - 1)
  fibs << fibs[-2] + fibs[-1]
end

# puts fibonacci(9)

def permute(array) #[1, 2]
  return [array] if array.length <= 1

  first = array.shift
  perms = permute(array)

  total_perms = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      total_perms << perm[0...i] + [first] + perm[i..-1]
    end
  end

  total_perms

end

# print permute([1,2,3])

def bsearch(nums, target)
  return nil if nums.empty?

  probe_index = nums.length / 2
  if target < nums[probe_index]
    # search in left
    bsearch(nums.take(probe_index), target)
  elsif target == nums[probe_index]
    probe_index # found it!
  else
    # search in the right; don't forget that the right subarray starts
    # at `probe_index + 1`, so we need to offset by that amount.
    sub_answer = bsearch(nums.drop(probe_index + 1), target)
    
  end

end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)

end

def merge_halp(half_1, half_2)

end

def subsets(array)

end

def greedy_make_change(amount, coins = [25, 10, 5, 1])

end

def make_better_change(amount, coins = [25, 10, 5, 1])

end

# def make_better_change(amount, coins = [25, 10, 5, 1])
#   coins.each { |coin| return [coin] if amount == coin }
#
#   difference = amount - coins[]
#   make_better_change(difference)
#
#   combos = [] #totally did right
#
#
# end
