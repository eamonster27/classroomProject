# Given a grade_hash, student name, and assignment number, return the score
# for that student and assignment. Note that Ruby counts arrays from 0, but
# we are referring to them as 1-10.
def assignment_score(grade_hash, student, assignment_num)
  grade_hash[student][assignment_num - 1]
end

# Given a grade_hash and assignment number, return all scores for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_scores(grade_hash, assignment_num)
  grade_hash.map do |key, value|
    value[assignment_num - 1]
  end
end

# Given a grade_hash and assignment number, return the average score for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_average_score(grade_hash, assignment_num)
  assignment = grade_hash.map do |key, value|
    value[assignment_num - 1]
  end

  sum = assignment.reduce do |sum, x|
    sum += x
  end

  sum / assignment.length
end

# Return a hash of students and their average score.
# TIP: To convert an array like [[:indiana, 90], [:nevada, 80]] to a hash,
# use .to_h. Also look at Hash#transform_values.
def averages(grade_hash)

  averages = grade_hash.map do |key, value|
    total = 1
    sum = grade_hash[key].reduce do |sum, grade|
      total += 1
      sum += grade
    end
    avg = sum / total
    [key, avg]
  end

  averages.to_h
end

# Return a letter grade for a numerical score.
# 90+ => A
# 80-89 => B
# 70-79 => C
# 60-69 => D
# < 60 => F
def letter_grade(score)
  case score
  when 80..89
    "B"
  when 70..79
    "C"
  when 90..1000
    "A"
  when 60..69
  "D"
  when 0..59
    "F"
  end

end

# Return a hash of students and their final letter grade, as determined
# by their average.
def final_letter_grades(grade_hash)
  averages = averages(grade_hash)

  final_grades = averages.map do |key, value|
    [key, letter_grade(value)]
  end

  final_grades.to_h
end

# Return the average for the entire class.
def class_average(grade_hash)
  averages = averages(grade_hash)
  sum = 0

  averages.map do |key, value|
    sum += value
  end

  sum / averages.length
end

# Return an array of the top `number_of_students` students.
def top_students(grade_hash, number_of_students)
  averages = averages(grade_hash)

  result = averages.sort_by do |key, value|
    value
  end

  students = result.map do |key, value|
    key
  end

  non_reversed = students.last(number_of_students)

  reversed = non_reversed.reverse
end
