def group_anagrams(arr)
  results = []
  unique_words = arr.map { |word| word.chars.sort.join }.uniq
  unique_words.each do |unique|
    anagrams = []
    arr.each do |word|
      anagrams << word if unique == word.chars.sort.join
    end
    results << anagrams if anagrams.length > 1
  end
  results.each { |result| p result }
end

words =  ["ssot", 'demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

group_anagrams(words)
