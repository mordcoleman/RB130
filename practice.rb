# class TextAnalyzer
#   def process
#     file = File.read("sample_text.txt")
#     yield(file)
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process {|file| puts "#{file.split("\n\n").count} paragraphs"}
# analyzer.process {|file| puts "#{file.split("\n").count} lines" }
# analyzer.process {|file| puts "#{file.split(" ").count} words" }

