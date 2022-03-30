require_relative 'lib/question'
require 'rexml/document'

questions = Question.from_file

scores = 0

questions.each do |question|
  puts question.question

  user_unswer = gets.chomp.downcase

  if question.answer == user_unswer
    scores += question.score
    puts 'Well'
  else
    puts "Well answer is #{question.answer}"
  end
end

#puts "You score #{scores}"
