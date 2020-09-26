words = "the flintstones rock"

def titleize(string)
  words = string.split(" ")
  words.map! {|word| word.capitalize! }
  words.join(" ")
end

p titleize(words)

