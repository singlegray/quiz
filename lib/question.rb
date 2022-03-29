class Question
  attr_reader :question, :answer, :score

  def initialize(question, answer, score, minutes)
    @question = question
    @answer = answer.downcase
    @score = score.to_i
  end
end
