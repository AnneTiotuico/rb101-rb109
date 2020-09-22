def select_fruit(hash)
  selected_pairs = {}
  counter = 0
  keys = hash.keys

  loop do
    break if counter == keys.size
    current_key = keys[counter]
    if hash[current_key] == 'Fruit'
      selected_pairs[current_key] = hash[current_key]
    end
    counter += 1
  end

  selected_pairs
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce)