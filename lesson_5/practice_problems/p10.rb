arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr.map do |hsh|
  hsh.each_with_object({}) do |(key, value), hash|
    hash[key] = value + 1
  end
end

