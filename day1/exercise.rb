#!/usr/bin/env ruby

HELPTEXT = <<~HELPTEXT
  ./exercise.rb number_of_components input.txt
HELPTEXT

if ARGV.count < 2
  puts HELPTEXT
  exit
end

specified_number = ARGV.first.to_i
input = File.read ARGV.last
numbers = input.split

numbers.map!(&:to_i)

parts = numbers.permutation(specified_number).find { |col| col.sum == 2020 }

unless parts&.any?
  p "Couldn't find #{specified_number} number(s) that summed to 2020"
  exit
end

p parts.reduce(&:*)
