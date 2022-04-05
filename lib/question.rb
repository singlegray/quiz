require 'rexml/document'
class Question
  attr_reader :text_question, :answer, :points, :minutes

  def initialize(text_question, answer, points, minutes, variants)
    @text_question = text_question
    @answer = answer.downcase
    @points = points.to_i
    @variants = variants
    @minutes = minutes.to_i
  end

  def right_answer?(user_variant)
    user_answer = @variants[user_variant - 1]
    @answer == user_answer
  end

  def variants
    @variants.shuffle!
  end
end
