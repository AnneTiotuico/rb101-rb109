=begin
def cleanup(string)
  p string.gsub(/[^a-z]/, ' ').squeeze(" ")
end

=end
# or without using regex
ALPHABET = ('a'..'z').to_a

def cleanup(string)
  chars = string.chars.each { |c| c.replace " " unless ALPHABET.include?(c) }
  p chars.join().squeeze(" ")
end


p cleanup("---what's my +*& line?") == ' what s my line '
