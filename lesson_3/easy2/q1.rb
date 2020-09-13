ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.has_key?("Spot")

#or
p ages.include?("Spot")

#or
p ages.key?("Spot")

#or
p ages.member?("Spot")
