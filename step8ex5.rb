def print(students)
    students.each do |student|
    puts "Name: #{student[:name]} from #{student[:country]}, in #{student[:cohort]} cohort"
    end
end

def input_students
    puts "Please enter the name of the students"
    puts "To finish, just hit return twice"
    students = []
    name = gets.chomp
    until name.empty?
      students << {name: name}
      puts "Which country is this person from?"
      place = gets.chomp
      students << {country: place}
      puts "Which cohort are they on?"
      course = gets.chomp
      students << {cohort: course}
      puts "Enter another student?"
      name = gets.chomp
    end
    students
end

students = input_students
input_students
print(students)