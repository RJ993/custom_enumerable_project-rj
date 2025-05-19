module Enumerable
  def my_each_with_index
    index = 0
    for item in self
    yield(item, index)
    index += 1
    end
  end
  def my_select
    array = []
    for item in self
      array.push(item) if yield(item)
    end
    return array
  end
  def my_all?
    array = []
    for item in self
      if yield(item)
        array.push(true) 
      else
        array.push(false)
      end
    end
    if Array.new(self.length, true) == array
      return true
    else
      return false
    end
  end
  def my_any?
    array = []
    for item in self
      if yield(item)
        array.push(true) 
      else
        array.push(false)
      end
    end
    if array.include?(true)
      return true
    else
      return false
    end
  end
  def my_none?
    array = []
    for item in self
      if yield(item)
        array.push(true) 
      else
        array.push(false)
      end
    end
    if Array.new(self.length, false) == array
      return true
    else
      return false
    end
  end
  def my_count
    counter = 0
    for item in self
      if block_given?
        counter +=1 if yield(item)
      else
        counter += 1
      end
    end
    return counter
  end
  def my_map
    array = []
    for item in self
      array.push(yield(item))
    end
    return array
  end
  def my_inject(total)
    for value in self
     total = yield(total, value)
    end
    total
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for item in self
      yield(item)
    end
  end
end