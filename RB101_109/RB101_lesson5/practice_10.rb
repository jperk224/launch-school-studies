# Given the following data structure and without modifying the original array, 
# use the map method to return a new array identical in structure to the original 
# but where the value of each integer is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_arr = arr.map do |hsh|
  new_hsh = {}
  hsh.each do |key, value|
    new_hsh[key] = value + 1
  end
  new_hsh  
end

p arr
p new_arr
