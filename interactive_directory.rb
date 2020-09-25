@students = [] # an empty array accessible to all methods

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    
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
                @students << {name: name, cohort: cohort}
                puts "Now we have #{@students.count} students"
                break
            when ""
                @students << {name: name, cohort: :Unassigned}
                puts "Now we have #{@students.count} students"
                break
            else
                puts "Please give a valid month or leave blank for unassigned"
                cohort = gets.chomp.downcase.capitalize
            end
        end
        name = gets.chomp
    end
end

def print_header
    puts "The students of Villains Academy"
    puts "--------------"
end
def print_students_list
    puts "Which cohort would you like to view"
    cohort_to_view = gets.chomp.downcase.capitalize
    while true do
        case cohort_to_view
        when "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
            @students.map do |student|
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
def print_footer
    puts  "Overall, we have #{@students.count} great students"
end
# nothing happens until we call the methods

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "9. Exit"
end

def show_students
    print_header
    print_students_list
    print_footer
end
    
def process(selection)
    case selection
    when "1"
        input_students  
    when "2"
        show_students
    when "3"
        save_students
    when "9"
        exit
    else 
    puts "I dont know what you mean"
    end
end

def interactive_menu
    loop do
        print_menu
        process(gets.chomp)
    end
end

def save_students
    # open the file for writing
    file = File.open("students.csv", "w")
    # iterate over the array of students
    @students.each do |student|
        student_date = [student[:name], student[:cohort]]
        csv_line = student_date.join(",")
        file.puts csv_line
    end
    file.close
end

interactive_menu