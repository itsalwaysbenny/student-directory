def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students)
    students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def fewer_than(students)
    puts "These students have names with fewer than 12 letters"
    students.each do |student|
        #only iterate over :name of hash not all of it
      if student[:name].length < 12
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
      else
      end
    end
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

def input_students
    puts "Please enter the name of the students"
    puts "To finish, just hit return twice"
    students = []
    name = gets.chomp
    while !name.empty? do
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        name = gets.chomp
    end
    students
end

students = input_students
fewer_than(students)
print_header
print(students)
print_footer(students)