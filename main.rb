require_relative 'lib/question'
require 'rexml/document'

filename = File.join(__dir__, 'data', 'questions.xml')
file = File.new(filename)

doc = REXML::Document.new(file)
doc.elements.each("questions/question") do |item|
  minutes item.attributes["minutes"]
  item.elements["text"].first
end

#questions_file = filenames.map { |filename| File.readlines(filename, chomp: true) }

##scores = 0

#questions = questions_file.sample(5).map { |question, answer, score| Question.new(question, answer, score) }

#questions.each do |question|
#  puts question.question

#  user_unswer = gets.chomp.downcase

#  if question.answer == user_unswer
#    scores += question.score
#    puts 'Well'
#  else
#    puts "Well answer is #{question.answer}"
#  end
#end

#puts "You score #{scores}"
