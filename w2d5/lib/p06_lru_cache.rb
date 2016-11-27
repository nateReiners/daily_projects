require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      update_link!(@map[key])
    else
      eject! while count >= @max
      calc!(key)
    end
    @map[key].val
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    val = @prc.call(key)
    @map[key] = @store.append(key, val)
  end

  def update_link!(link)
    link.remove
    @store.append(link.key, link.val)
  end

  def eject!
    link_to_del = @store.head.next
    @map.delete(link_to_del.key)
    link_to_del.remove
  end
end
