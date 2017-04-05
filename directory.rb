@students = []

def print_header
    puts "The students of Villains Academy".center(50)
    puts "--------------".center(50)
end

def print_student_list()
    if @students.empty?
        puts "There are no students"
    else
   #use group_by to get key: value groups, with[:modifier]
    student_month = @students.group_by {|stu| stu[:cohort]}
    student_month.map do |k, v|
        puts "#{k}"
        for index in 0..v.size-1 do
        puts "#{index+1}. #{v[index][:name]}, #{v[index][:country]}"
        end
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
    #can use .chop instead of chomp will remove the last character from string
    name = STDIN.gets.chop
    until name.empty?
      puts "Which country is this person from?".center(50)
      place = STDIN.gets.chomp
      puts "Which cohort are they on?".center(50)
      course = STDIN.gets.chomp
      if course.empty?
         course = "None"
      else
      end
      # must push to hash after all information is gathered
      @students << {name: name, cohort: course, country: place}
      puts "Enter another student?".center(50)
      name = STDIN.gets.chomp
    end
    @students
end
def print_menu
      puts "1. Input the students."
      puts "2. Show the students."
      puts "3. Save the list to students.csv"
      puts "4. Load the list from students.csv"
      puts "9. Exit"
end

def show_students()
      print_header
      print_student_list()
      print_footer(@students)
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load__students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of studnets
  @students.each do |student|
  student_data = [student[:name], student[:cohort], student[:country]]
  csv_line = student_data.join(",")
  file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, country, cohort = line.chomp.split(',')
    @students << {name: name, country: country.to_sym, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students(filename = "students.csv")
  filename = ARGV.first# first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu