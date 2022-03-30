class Question
  attr_reader :question, :answer, :points, :minutes, :variants

  def self.from_file
    questions = []

    filename = File.join(__dir__,'/../', 'data', 'questions.xml')
    file = File.new(filename)

    doc = REXML::Document.new(file)
    doc.elements.each("questions/question") do |item|
      minutes = item.attributes["minutes"]
      points = item.attributes["points"]
      text = item.elements["text"].first
      variants = []
      item.elements.each("variants/variant") do |variant|
        binding.irb
        variants << variant.elements["variant"].first
        
        answer = variant.elements["variant"].first if item.attributes["right"] == "true"
      end
      questions << self.new(text, answer, points, minutes, variants)
    end
    return questions
  end

  def initialize(question, answer, points, minutes, variants)
    @question = question
    @answer = answer.downcase
    @points = points.to_i
  end
end
