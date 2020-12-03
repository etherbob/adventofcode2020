#!/usr/bin/env ruby

HELPTEXT = <<~HELPTEXT
  ./exercise.rb input.txt
HELPTEXT

def extract_rule(rule)
  pos1, pos2 = rule.split('-')
  pos1 = pos1.to_i - 1
  pos2 = pos2.to_i - 1
  return pos1, pos2
end

if ARGV.count < 1
  puts HELPTEXT
  exit
end

input = File.read ARGV.first

lines = input.lines

valid = lines.select do |line|
  rule, char, pw = line.split(' ')
  position1, position2 = extract_rule(rule)
  char = char.chomp(':')
  first = pw[position1]
  second = pw[position2]
  [first, second].select{|x| x == char }.count == 1
end

p "#{valid.count} of #{lines.count} are valid"
