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
    # def read_log 
    #     @patient_log = []
    #     File.foreach("#{@patient_name}.txt") {|line| @patient_log.push(line.chomp)}
        
    # end

    # def add_log(log)
    #     File.write("#{@patient_name}.txt", mode: "a")
    # end
end

class Patient
    attr_reader :first_name, :last_name, :species, :breed, :age, :sex
    def initialize(full_name, species)
        @first_name = first_name
        @last_name = last_name
        @species =species
        @breed = breed
        @age = age
        @sex = sex
    end
    # def read_log 
    #     @patient_log = []
    #     File.foreach("#{@patient_name}.txt") {|line| @patient_log.push(line.chomp)}
        
    # end

    # def add_log(log)
    #     File.write("#{@patient_name}.txt", mode: "a")
    # end
end

#databases
user_database = []
begin
CSV.foreach("Users.csv", headers: true) do |row| 
user_database << User.new(row["username"], row["password"])
rescue 
    puts "Database, empty, create a user"
    
end

end

patient_database = []
begin
CSV.foreach("Patients.csv", headers: true) do |row| 
patient_database << Patient.new(row["patient_full_name"], row["species"])
rescue 
    puts "patient database empty, please add a patient"
    
end

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
patient = nil

    loop do    
        if  welcome == "Create Account"
        user_name= prompt.ask("Enter a username")
        user_password = prompt.mask("Enter a password")
        user = User.new(user.user_name, user.user_password)
        user_database << user
        CSV.open("Users.csv", "a") { |csv| csv << ["#{user_name}", "#{user_password}"] } 
            puts "Welcome #{user.user_name}, you are now logged in"

            elsif welcome == "Login"
            username = prompt.ask("Enter username")
            current_user = user_database.find{ |user| user.username == username}
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

        if main_menu == "Find Patient" && patient == nil
            patient_full_name= prompt.ask("Patient Full Name")
            current_patient = patient_database.find{ |patient| patient == patient_full_name}
                if patient_full_name == current_patient
                   patient == current_patient
                else
                puts "Access Denied"
                end 
                if patient != nil
                    patient_menu = prompt.select("Would you like to add log or read log?") do |menu|
                        menu.choice "Add"
                        menu.choice "Read"
                        menu.choice "Exit"   
                        end 
                        if patient_menu == "Add"
                        new_log = prompt.ask("type your log")
                        add_log(new_log)
                        File.write("#{@patient_name}.txt", mode: "a")
                        end
                    end
                break
        elsif main_menu == "Add Patient"
                patient_full_name= prompt.ask("Patient Full Name")
                patient_species= prompt.ask("Patient Species")
                patient_breed= prompt.ask("Patient Breed")
                patient_age= prompt.ask("Patient Age")
                patient_sex= prompt.ask("Patient Sex")
                patient = Patient.new(patient_full_name, patient_species)
                patient_database << patient
                CSV.open("Patients.csv", "a") do |csv| 
                    csv << ["#{patient_full_name}", "#{patient_species}", "#{patient_breed}", "#{patient_age}", "#{patient_sex}"]   
                end    
                puts "Thank you, #{patient_full_name} has been added to the system"
        elsif patient_menu == "Exit"
            puts "Thank you #{username}, you have now logged out"
            user = nil
            system("clear")
            puts ""
            break
        else 
            puts "Invalid Input"
        end
    end
end

