# problem
# take in an array of nested entries
# each entry is a sub array with [fruit, count]
# return a new array with the apprpriate number of fruit elements based on the count


# examples
#p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]


# ds/algo
# initialize an empty array fruit_list
# take the first element in the outer array
# insert into fruit_list the fruit, repeated for each count in the subarray
# repeat for each subarray in the outer array
# return fruit_list

# code
def buy_fruit(arr)
  fruit_list = []
  arr.each do |subarray|
    subarray[-1].times do
      fruit_list << subarray[0]
    end
  end
  fruit_list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]
