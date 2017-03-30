
def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students)
    st = 0
    until st == students.count
    puts "{
        #{students[st][:stu_name[st]][:name]}
        from #{students[st][:name][:country]}
        (#{students[st][:name][:cohort]} cohort)
        }"
    end
end

def print_footer(names)
    puts "Overall, we have #{stu_name.count} great students"
end

def input_students
    puts "Please enter the name of the students"
    puts "To finish, just hit return twice"
    students = []
    name = gets.chomp
    stu_name = []
    until name.empty? do
      stu_name << {name: name}
      name = []
      puts "Which country is this person from?"
      place = gets.chomp
      name << {country: place}
      puts "Which cohort are they on?"
      course = gets.chomp
      name << {cohort: course}
      puts "Enter another student?"
      name = gets.chomp
    end
    students << name
end


students = input_students
print_header
print(students)
print_footer(students)