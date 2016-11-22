require 'byebug'

def range(start, tail)
  return [] if tail < start

  results = range(start, tail - 1)
  results << tail

  p [start, tail, results]
  results
end

def exponentiation(base, power)
  return 1 if base == 1 || power < 1

  base * exponentiation(base, power - 1)
end

def exponentiation_2(base, power)
  return 1 if base == 1 || power < 1

  if power.even?
    exponentiation_2(base, power / 2) ** 2
  else
    base * exponentiation_2(base, (power - 1) / 2) ** 2
  end
end

def deep_dup(arr)
  return arr if arr.class != Array
  return arr.dup unless arr.any? { |el| el.is_a?(Array) }

  arr.map { |sub_arr| deep_dup(sub_arr) }
end

# fib(x) = fib(x - 1) + fib(x - 2)
def fibonacci(n)
  return [1] if n <= 1
  return [1, 1] if n == 2

  fibonacci(n - 1) << fibonacci(n - 1)[-1] + fibonacci(n - 1)[-2]
end
#
# def permute(array) #[1, 2]
#   return [array] if array.length == 1
#   results = []
#   # debugger
#   array.each do |el|
#     sub_results = permute(array.reject { |x| x == el })
#       #if sub_results == 1
#     sub_results.each do |sub_arr|
#       sub_arr.unshift(el)
#     end
#   end
#
#   results
# end
#

def bsearch(array, target)
  if array.length == 1
    return array[0] == target ? 0 : nil
  end

  midpoint = (array.length / 2)

  if array[midpoint] > target
    lower_half = array[0...midpoint]
    bsearch(lower_half, target)
  elsif array[midpoint] < target
    upper_half = array[midpoint..-1]
    updawg = bsearch(upper_half, target)
    return nil if updawg.nil?
    midpoint + updawg
  else
    return midpoint
  end

end

def merge_sort(array)
  return array if array.length <= 1

  midpoint = array.length / 2
  half_1 = merge_sort(array[0...midpoint])
  half_2 = merge_sort(array[midpoint..-1])

  merge_halp(half_1, half_2)
end

def merge_halp(half_1, half_2)
  results = []
  until half_1.empty? || half_2.empty?
    comparison = half_1.first <=> half_2.first
    if comparison == -1
      results << half_1.shift
    else
      results << half_2.shift
    end
  end
  results + half_1 + half_2
end

def subsets(array)
  #debugger
  return [array] if array.length <= 0
  last_item = array[-1]
  head = array[0...-1]
  doop_head = deep_dup(head)
  subsets(head) + subsets(doop_head).map { |el| el << last_item }
end

def greedy_make_change(amount, coins = [25, 10, 5, 1])
  return [coins[0]] if amount <= coins[0]
  difference = amount - coins[0]
  current_coin = coins[0]
  coins.shift if difference < coins[0]
  remaining_coins = greedy_make_change(difference, coins)
  remaining_coins.unshift(current_coin)
end

def make_better_change(amount, coins = [25, 10, 5, 1])
  coins.each { |coin| return [coin] if amount == coin }

  coin_combos = []
  coins.each do |coin|
    difference = amount - coin
    coin_combos + [make_better_change(difference) + [coin]]
  end

  coin_combos
  coin_combos.min(&:length)
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
