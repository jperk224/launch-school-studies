# problem
# write a method that returns the number of Friday the 13ths in a given year
# may assume year is greater than 1752

# examples
# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2

# ds/algo
# convert the argument to date object to get the first week day of the given year
# advance to first friday of the year
# set days_elapsed to days needed to advance to friday
# set current_date = date + days_elapsed
# determine whether the year is a leap year
  # if so - days_in_year is 366, else 365
# initialize number_of_fridays, set to 0
# while days_elapsed <= days_in_year
  # check whether current_date is 13th
    #if so, increment number_of_fridays
  # increment days_elapsed by 7
# return number_of_fridays

# code
require 'date'
require 'pry'

def is_leap_year?(year)
  case
  when year % 400 == 0
    true
  when year % 100 == 0
    false
  when year % 4 == 0
    true
  else
    false
  end 
end

def friday_13th(year)
  year_date = Date.new(year)
  days_elapsed = 0
  if year_date.wday < 5
    year_date += (5 - year_date.wday)
    days_elapsed = (5 - year_date.wday)
  elsif year_date.wday > 5
    year_date += 6
    days_elapsed = 6
  end
  number_of_fridays = 0
  number_of_days = 365
  number_of_days = 366 if is_leap_year?(year)
  while days_elapsed <= number_of_days do
    number_of_fridays += 1 if year_date.mday == 13
    days_elapsed += 7
    year_date += 7
  end
  number_of_fridays
end

# p is_leap_year?(2000)
# p is_leap_year?(1900)
# p is_leap_year?(2020)
# p is_leap_year?(2024)
# p is_leap_year?(2028)
# p is_leap_year?(1999)
p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
