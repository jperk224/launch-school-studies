# select all key-value pairs where value is 'Fruit'

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

# def select_produce(produce)
#   produce.select { |key, value| value == 'Fruit'}
# end

# p select_produce(produce)

def select_produce(produce)
  counter = 0
  keys_Array = produce.keys
  fruit_hash = {}
  loop do
    break if counter >= keys_Array.length
    if produce[keys_Array[counter]] == 'Fruit'
      fruit_hash[keys_Array[counter]] = produce[keys_Array[counter]]
    end
    counter += 1
  end
  fruit_hash
end

p select_produce(produce)

def double_numbers!(arr)
  counter = 0
  loop do
    break if counter >= arr.size
    arr[counter] = arr[counter] * 2
    counter += 1
  end
end

arr = [1, 2, 3, 4, 5]
p arr
double_numbers!(arr)
p arr

# Code a solution that doubles array numbers if they have odd indicies
def double_odd_idx(arr)
  doubled_array = []
  counter = 0
  loop do
    break if counter >= arr.size
    number = arr[counter]
    number *=2 if counter.odd?
    doubled_array << number
    counter += 1
  end
  doubled_array
end

p double_odd_idx([0, 1, 0, 1, 0, 1, 0])

def multiply_numbers!(arr, multiplier)
  counter = 0
  loop do
    break if counter >= arr.size
    arr[counter] = arr[counter] * multiplier
    counter += 1
  end
end

arr = [1, 2, 3, 4, 5]
p arr
multiply_numbers!(arr, 3)
p arr
