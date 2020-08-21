# write a method that returns a random UUID
# Each UUID consists of 32 hexadecimal characters, 
# and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.
# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

def generate_uuid
  generation_format = [8, 4, 4, 4, 12]
  hex_hash = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
  uuid_arr = [] 
  uuid_hash = generation_format.each do |count|
    string = ''
    count.times do
      string << hex_hash.sample
    end
    uuid_arr << string
  end
  uuid_arr.join('-')
end

p generate_uuid
