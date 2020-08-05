# assume you have the following array

a = [1, 4, 8, 11, 15, 19]

# How would you search this Array to find the first element whose value exceeds 8?

p a.bsearch { |x| x > 8 }
