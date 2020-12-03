#!/usr/bin/env ruby

HELPTEXT = <<~HELPTEXT
  ./exercise.rb input.txt
HELPTEXT

def extract_rule(rule)
  min, max = rule.split('-')
  return min.to_i, max.to_i
end

if ARGV.count < 1
  puts HELPTEXT
  exit
end

input = File.read ARGV.first

lines = input.lines

valid = lines.select do |line|
  rule, char, pw = line.split(' ')
  min, max = extract_rule(rule)
  char = char.chomp(':')
  appearances = pw.chars.select{ |c| c == char }.count
  appearances >= min && appearances <= max
end

p "#{valid.count} of #{lines.count} are valid"
