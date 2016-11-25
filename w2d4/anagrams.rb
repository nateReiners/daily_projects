require 'byebug'

def first_anagram?(str1, str2)
  perms = str1.chars.permutation.to_a.map(&:join)

  perms.include?(str2)
end


# w1 = "afdjksfad"
# w2 = "afdjksfad".chars.shuffle.join
# p first_anagram?(w1, w2)

def second_anagram?(str1, str2)
  return false if str1.length != str2.length
  letters1 = str1.chars
  letters2 = str2.chars
  deleted = false

  idx = 0
  # debugger
  until letters1.empty? || letters2.empty?
    el = letters1[idx]
    letters2.each_with_index do |el2, idx2|
      if el == el2
        letters1.shift
        letters2.delete_at(idx2)
        deleted = true
      end
    end
    deleted ? idx = 0 : idx += 1
  end

  letters1.empty? && letters2.empty?
end

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end



p third_anagram?("anton", "tonttna")
