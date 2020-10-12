def swap_name(name)
  name_arr = name.split
  "#{name_arr[1]}, #{name_arr[0]}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
