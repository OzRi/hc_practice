# frozen_string_literal: true

require 'date'
require 'optparse'

def calender_header(date)
  first_day = Date.new(date.year, date.month, 1)
  first_day_wday = first_day.wday
  puts date.strftime('%m月 %Y').center(20)
  puts '月 火 水 木 金 土 日'
  print '   ' * (first_day_wday.zero? ? 6 : first_day_wday - 1)
end

def date_display(date)
  first_day = Date.new(date.year, date.month, 1)
  last_day = Date.new(date.year, date.month, -1)
  display_days(first_day, last_day)
end

def display_days(first_day, last_day)
  (first_day..last_day).each do |day|
    number = day.day.to_s.rjust(2)
    if day == Date.today
      number = "\e[47m#{number}\e[0m"
    else
      number
    end
    print "#{number}#{day.sunday? ? "\n" : ' '}"
  end
end

today = Date.today

opt = OptionParser.new
opt.on('-m') { |v| v }
opt.parse(ARGV)
option_num = ARGV[1].to_i

if ARGV.empty?
  calender_header(today)
  date_display(today)
elsif (1..12).include?(option_num)
  calender_header(Date.new(today.year, option_num, 1))
  date_display(Date.new(today.year, option_num, 1))
else
  print "#{option_num} is neither a month number (1..12) nor a name"
end
