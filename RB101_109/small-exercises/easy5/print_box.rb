require 'pry'

def print_row(string, include_string=false, border_char='|', mid_char=' ')
  
  if string.length > 80
    row_chars = mid_char * (82)
  else
    row_chars = mid_char * (string.length + 2)
  end
  
  if include_string
    strings = []
    
    while string.length >= 80
      strings << string.slice!(0,80)
    end

    strings << string # grab the last piece < 80 characters
    
    strings.each do |string| 
      if string.length >= 80 && strings.length > 1
        puts "#{border_char}#{mid_char}#{string}#{mid_char}#{border_char}"
      elsif strings.length > 1
        puts "#{border_char}#{mid_char}#{string}#{' ' * (80 - string.length)}#{mid_char}#{border_char}"
      else
        puts "#{border_char}#{mid_char}#{string}#{mid_char}#{border_char}"
      end
    end
  else
    puts "#{border_char}#{row_chars}#{border_char}"
  end
end

def print_in_box(string)
  print_row(string, false, '+', '-')
  print_row(string)
  print_row(string, true)
  print_row(string)
  print_row(string, false, '+', '-')
end

# print_in_box('To boldly go where no one has gone before.')
# print_in_box('')
test_string = (0..100).to_a.map { |digit| digit.to_s}.join
print_in_box(test_string)