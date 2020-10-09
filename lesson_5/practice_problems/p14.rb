hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
result = hsh.each_with_object([]) do |(_, value), arr|
  arr << value[:colors].map {|color| color.capitalize} if value[:type] == 'fruit'
  arr << value[:size].upcase if value[:type] == 'vegetable'
end

p result == [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

