def palindrome?(obj)
  obj == obj.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true


p palindrome?(%w(m a d a m)) == true
p palindrome?(%w(M a d a m)) == false          # (case matters)
p palindrome?(%w(madam i'm adam)) == false # (all characters matter)
p palindrome?(%w(3 5 6 6 5 3)) == true