def greetings(arr, hsh)
  full_name = arr.join(' ')
  title = hsh[:title]
  occupation = hsh[:occupation]
  "Hello, #{full_name}! Nice to have a #{title} #{occupation} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.
