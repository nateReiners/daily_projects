class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    (self.join << self.length.to_s).to_i.hash
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    keys = self.keys.sort.map(&:to_s).join
    values = self.values.sort.map(&:to_s).join
    (keys + values).hash
  end
end
