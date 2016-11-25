require 'byebug'

def my_min1(array)
  val = array.first
  array.each_with_index do |el1, idx1|
    array.each_with_index do |el2, idx2|
      next if idx1 == idx2
      case el1 <=> el2
      when -1
        val = el1 if val > el1
      when 0
        next
      when 1
        val = el2 if val > el2
      end
    end
  end

  val
end

  def my_min2(array)
    val = array.first
    array[1..-1].each do |el|
      val = el if el < val
    end

    val
  end
#
# x = (1..10).to_a.shuffle
# p x
# p my_min1(x)

def lcs1(list)
  subs = []
  greatest_sum = 0

  list.each_with_index do |el1, idx1|
    list.each_with_index do |el2, idx2|
      next if idx1 >= idx2

      subs << list[idx1..idx2] unless list[idx1..idx2].empty?
      end
    end
    p subs
    subs.each do |slice|
      current_sum = slice.inject(:+)
      if current_sum > greatest_sum
        greatest_sum = current_sum
      end
    end

    greatest_sum
end

def lcs2(list)
  greatest_sum = list.first
  current_total = 0


  list.each do |el|
# debugger
    if current_total + el < 0
      current_total += el
      greatest_sum = current_total if current_total > greatest_sum
      current_total = 0
    else
      current_total += el
      greatest_sum = current_total if current_total > greatest_sum
    end
  end

  greatest_sum
end


# x = (-3..3).to_a.shuffle
#
# p x
# p lcs2(x)
