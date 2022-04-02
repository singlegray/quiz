require_relative 'lib/question'
require 'timeout'

questions = Question.from_file

scores = 0

questions.each do |question|
  puts question.text_question

  question.variants.each_with_index do |variant, index|
    puts "#{index + 1} #{variant}"
  end

  user_variant = ''

  begin
    Timeout::timeout(question.minutes) do
      user_variant = gets.to_i
    end
  rescue Timeout::Error
    puts "\nDid not have time. End game"
    break
  end

  if question.right_answer?(user_variant)
    scores += question.points
    puts 'Well'
  else
    puts "Well answer is #{question.answer}"
  end
end

puts "You score #{scores}"
