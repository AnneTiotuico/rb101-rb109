flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.insert(-1, "Dino", "Happy")
p flintstones

# or
flintstones.concat(%w(Dino Hoppy))

# or
flintstones.push("Dino").push("Hoppy")
