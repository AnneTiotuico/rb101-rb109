munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_male_age = 0
munsters.each do |member|
  member.each do |info|
    total_male_age += info["age"] if info["gender"] == "male"
  end
end

p total_male_age

# or

# total_male_age = 0
# munsters.each_value do |details|
#   total_male_age += details["age"] if details["gender"] == "male"
# end

# total_male_age # => 444
