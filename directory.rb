
def print_header
    puts "The students of Villains Academy".center(50)
    puts "-------------".center(50)
end

def print(students)
    students.each do |student|
    puts "Name: #{student[:name]} from #{student[:country]}, in #{student[:cohort]} cohort".center(50)
    end
end

def print_footer(names)
    puts "--------------".center(50)
    puts "Overall, we have #{names.count} great students".center(50)
end

def input_students
    puts "Please enter the name of the students".center(50)
    puts "To finish, just hit return twice".center(50)
    students = []
    name = gets.chomp
    until name.empty?
      puts "Which country is this person from?".center(50)
      place = gets.chomp
      puts "Which cohort are they on?".center(50)
      course = gets.chomp
      if course.empty?
         course = "None"
      else
      end
      # must push to hash after all information is gathered
      students << {name: name, cohort: course, country: place}
      puts "Enter another student?".center(50)
      name = gets.chomp
    end
    students
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)