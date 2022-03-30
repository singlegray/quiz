require_relative 'lib/question'
require 'rexml/document'

questions = Question.from_file

scores = 0

questions.each do |question|
  puts question.question

  question.variants.shuffle!.each_with_index do |variant, index|
    puts "#{index + 1} #{variant}"
  end

  starttime = Time.new

  user_variant = gets.to_i
  user_answer = question.variants[user_variant - 1]

  endtime = Time.new

  alltime = endtime - starttime
  if alltime > (question.minutes * 60)
    puts 'Did not have time. End game'
    abort
  end

  if question.answer == user_answer
    scores += question.points
    puts 'Well'
  else
    puts "Well answer is #{question.answer}"
  end
end

puts "You score #{scores}"
