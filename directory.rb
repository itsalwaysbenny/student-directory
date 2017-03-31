
def print_header
    puts "The students of Villains Academy".center(50)
    puts "--------------".center(50)
end

def print(students)
    if students.empty?
        puts "There are no students"
    else
    #use group_by to get key: value groups, with[:modifier]
    student_month = students.group_by {|stu| stu[:cohort]}
    student_month.map do |y|
        # prints all cohort together but still in array and hash
        #find out how to get it out
        puts "#{y}"
    end
    end
end

def print_footer(names)
    puts "--------------".center(50)
    if names.count == 0
        puts "We don't have any students"
    elsif names.count == 1
        puts "We have #{names.count} great student"
    else
    puts "Overall, we have #{names.count} great students".center(50)
    end
end

def input_students
    puts "Please enter the name of the students".center(50)
    puts "To finish, just hit return twice".center(50)
    students = []
    #can use .chop instead of chomp will remove the last character from string
    name = gets.chop
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


students = input_students
print_header
print(students)
print_footer(students)