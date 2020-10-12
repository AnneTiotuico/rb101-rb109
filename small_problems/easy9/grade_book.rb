def get_grade(score1, score2, score3)
  average = (score1 + score2 + score3) / 3
  case
  when average >= 90
    "A"
  when average >= 80
    "B"
  when average >= 70
    "C"
  when average >= 60
    "D"
  else
    "F"
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
