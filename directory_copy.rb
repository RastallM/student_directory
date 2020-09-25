# first we ask for input of student details
def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
        # require additional input for cohort
        puts "Enter the student's cohort"
        cohort = gets.chomp.downcase.capitalize
        # use case to determine how to handle cohort input
        while true do
            case cohort
            when "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
                students << {name: name, cohort: cohort}
                puts "Now we have #{students.count} students"
                break
            when ""
                students << {name: name, cohort: :Unassigned}
                puts "Now we have #{students.count} students"
                break
            else
                puts "Please give a valid month or leave blank for unassigned"
                cohort = gets.chomp.downcase.capitalize
            end
        end
        name = gets.chomp
    end
    #  return the array of students
    students
end

def print_header
    puts "The students of Villains Academy"
    puts "--------------"
end
def print(students)
    puts "Which cohort would you like to view"
    cohort_to_view = gets.chomp.downcase.capitalize
    while true do
        case cohort_to_view
        when "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
            students.map do |student|
                if student[:cohort] == cohort_to_view
                puts "#{student[:name]} (#{student[:cohort]} cohort.)".center(100," ")
                end
            end
            break
        else
            puts "Please input a month"
            cohort_to_view = gets.chomp
        end 
    end
end
def print_footer(students)
    puts  "Overall, we have #{students.count} great students"
end
# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)