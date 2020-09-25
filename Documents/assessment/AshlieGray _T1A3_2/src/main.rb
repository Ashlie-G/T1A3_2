require 'colorize'
require 'colorized_string'
require "tty-prompt"
require 'csv'



#classes and methods
class User
    attr_reader :username, :password
    def initialize(username, password)
        @username = username
        @password = password
        @patient_log = []
    end
    def read_log 
        @patient_log = []
        File.foreach("#{@patient_name}.txt") {|line| @patient_log.push(line.chomp)}
        
    end

    def add_log(log)
        File.write("#{@patient_name}.txt", mode: "a")
    end
end

class Patient
    attr_reader :first_name, :last_name, :species, :breed, :age, :sex
    def initialize(first_name, last_name)
        @first_name = first_name
        @last_name = last_name
        @species =species
        @breed = breed
        @age = age
        @sex = sex
    end
    def read_log 
        @patient_log = []
        File.foreach("#{@patient_name}.txt") {|line| @patient_log.push(line.chomp)}
        
    end

    def add_log(log)
        File.write("#{@patient_name}.txt", mode: "a")
    end
end

#databases
user_database = []
CSV.foreach("Users.csv", headers: true) do |row| 
    user_database << User.new(row["username"], row["password"])
end
patient_database = []
CSV.foreach("Patients.csv", headers: true) do |row| 
    patient_database << Patient.new(row["username"], row["password"])
end

#opening menu
prompt = TTY::Prompt.new



puts "TPRP Monitor"
sleep 1
welcome = prompt.select("Login or Create New") do |menu|
menu.choice "Login"
menu.choice "Create Account"
menu.choice "Exit"   
end
user = nil

    loop do    
        if  welcome == "Create Account"
        user_name= prompt.ask("Enter a username")
        user_password = prompt.mask("Enter a password")
        user = User.new(user_name, user_password)
        user_database << user
        CSV.open("Users.csv", "a") do |csv| 
            csv << ["#{user_name}", "#{user_password}"]   
            end    
            puts "Welcome #{user_name}, you are now logged in"

            elsif welcome == "Login"
            username = prompt.ask("Enter username")
            current_user = user_database.find{ |user| user == username}
                if username == current_user.username
                password = prompt.mask('Enter your password')
                if password == current_user.password
                   user == current_user
                else
                puts "Access Denied"
                end 
                 break
        elsif welcome == "Exit"
                user = nil
                break
        else
            puts "invalid Input"
        end
    end
    if user != nil
        main_menu = prompt.select("What would you like to do?") do |menu|
            menu.choice "Find Patient"
            menu.choice "Add Patient"
            menu.choice "Help"
            menu.choice "Exit"   
        end

        if main_menu == "Find Patient"
            patient_first_name= prompt.ask("Patient First Name")
            patient_last_name= prompt.ask("Patient Last Name")
            #search patient data base
            # begin
            #     user.read_log
            # rescue
            #     puts "You haven't added any notes yet!"
            # end
        elsif main_menu == "Add Patient"
                patient_first_name= prompt.ask("Patient First Name")
                patient_last_name= prompt.ask("Patient Last Name")
                patient_species= prompt.ask("Patient Species")
                patient_breed= prompt.ask("Patient Breed")
                patient_age= prompt.ask("Patient Age")
                patient_sex= prompt.ask("Patient Sex")
                patient = Patient.new(patient_first_name, patient_last_name)
                patient_database << patient
                CSV.open("Patients.csv", "a") do |csv| 
                    csv << ["#{patient_first_name}", "#{patient_last_name}", "#{patient_species}", "#{patient_breed}", "#{patient_age}", "#{patient_sex}"]   
                end    
                puts "Thank you, #{patient_first_name} has been added to the system"
        elsif input == "Exit"
            puts "Thank you #{user.username}, you have now logged out"
            user = nil
            system("clear")
            puts ""
            break
        else 
            puts "Invalid Input"
        end
    end
end
