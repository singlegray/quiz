require "rexml/document"
class Question
  attr_reader :text_question, :answer, :points, :minutes

  def self.from_file
    filename = File.join(__dir__,'/../', 'data', 'questions.xml')
    file = File.new(filename)

    doc = REXML::Document.new(file)

    questions =
      doc.root.get_elements("question").map do |item|

      minutes = item.attributes['minutes'].to_i * 60
      points = item.attributes['points']
      text = item.elements['text'].first
      answer = ''

      variants =
        item.get_elements("variants/variant").map do |variant|
          answer = variant.text if variant.attributes['right'] == 'true'
          variant.text
        end

      self.new(text, answer, points, minutes, variants)
    end
  end

  def right_answer?(user_variant)
    user_answer = @variants[user_variant - 1]
    @answer == user_answer
  end

  def variants
    @variants.shuffle!
  end

  def initialize(text_question, answer, points, minutes, variants)
    @text_question = text_question
    @answer = answer.downcase
    @points = points.to_i
    @variants = variants
    @minutes = minutes.to_i
  end
end
