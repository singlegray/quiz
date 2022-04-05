module Question_Constructor
  def self.from_file
    filename = File.join(__dir__, '/../', 'data', 'questions.xml')
    file = File.new(filename)

    doc = REXML::Document.new(file)

    questions =
      doc.root.get_elements('question').map do |item|
        minutes = item.attributes['minutes'].to_i * 60
        points = item.attributes['points']
        text = item.elements['text'].first
        answer = ''

        variants =
          item.get_elements('variants/variant').map do |variant|
            answer = variant.text if variant.attributes['right'] == 'true'
            variant.text
          end

        Question.new(text, answer, points, minutes, variants)
      end
  end
end
