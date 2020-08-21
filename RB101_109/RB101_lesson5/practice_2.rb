# order this array of hashes based on the year of publication of each book
# from the earliest to the latest

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

sorted_books = books.sort do |book1, book2|
  book1[:published] <=> book2[:published]
end

sorted_books_2 = books.sort_by do |book|
  book[:published]
end

puts sorted_books
puts sorted_books_2
