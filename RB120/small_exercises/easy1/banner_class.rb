# given a class with empty instance methods, pass the example test cases
# add any instance variables or methods needed, but keet them private

class Banner
  def initialize(message, width=message.size + 2)
    @message = message
    @banner_length = width
    if @banner_length < @message.size + 2
      puts "Width too small, adjusting."
      @banner_length = @message.size + 2
    end
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+#{'-' * banner_length}+"
  end

  def empty_line
    "|#{' ' * banner_length}|"
  end

  def message_line
    "| #{@message} |"
  end

  attr_reader :banner_length
end



# what are we doing?
# printing a banner that's 2 spaces greater than the length of the message
  # add a private @banner_length instance variable and initialize it in the constructor to 2 + the length of the message

# print the horizontal rule
  # return a string that is bookended by '+' and has '-' times @banner_length

# print empty line
  # return a string that is bookended by '|' and has ' ' times @banner_length


# examples

banner = Banner.new('To boldly go where no one has gone before.', 2)
puts banner
=begin
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
=end
banner = Banner.new('')
puts banner
=begin
+--+
|  |
|  |
|  |
+--+
=end