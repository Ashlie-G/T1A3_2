require 'colorize'
require 'colorized_string'
require 'tty-prompt'
require 'csv'




#classes and methods
class User
    attr_reader :username, :password
    def initialize(username, password)
        @username = username
        @password = password
        
    end
end

class Patient
    attr_reader :species, :breed, :age, :sex
    attr_accessor :full_name
    def initialize(full_name, species, breed, age, sex)
        @full_name = full_name
        @species =species
        @breed = breed
        @age = age
        @sex = sex
        @patient_log
    end
end

@patient_log = []
def read_log(log) 
    @patient_log << log
    File.foreach("belle.txt") {|line| @patient_log.push(line)}
    puts @patient_log
    
end

def add_log(temperature, pulse, respiration, pain)
    @patient_log = temperature, pulse, respiration, pain
    File.write("belle.txt", @patient_log, mode: "a")
end

#databases
user_list = []

CSV.foreach("Users.csv", headers: true) do |row| 
user_list << User.new(row["username"], row["password"])
end

patient_list = []

CSV.foreach("Patients.csv", headers: true) do |row| 
patient_list << Patient.new(row["full_name"], row["species"], row["breed"], row["age"], row["sex"])
end


# CSV.foreach("belle.csv", headers: true) do |row| 
# patient_list << Patient.new(row["Temperature"], row["Pulse"], row["Respiratory Rate"], row["Pain"])
# end

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
        user = User.new(user_name, user_password)
        user_list << user
        CSV.open("Users.csv", "a") { |csv| csv << ["#{user_name}", "#{user_password}"] } 
            puts "Welcome #{user_name}, you are now logged in"

            elsif welcome == "Login"
            username = prompt.ask("Enter username")
            current_user = user_list.find{ |user| user.username == username}
                if username == current_user.username
                password = prompt.mask('Enter your password')
                if password == current_user.password
                   user == current_user
                else
                puts "Access Denied"
                end 
                
        elsif welcome == "Exit"
                user = nil
                break
        else
            puts "invalid Input"
            break
        end
    end
    
    loop do
        main_menu = prompt.select("What would you like to do?") do |menu|
            menu.choice "Find Patient"
            menu.choice "Add Patient"
            menu.choice "Help"
            menu.choice "Exit"   
            end
        
        if main_menu == "Find Patient" 
            patient_full_name= prompt.ask("Patient Full Name")
            current_patient = patient_list.find{ |patient| patient.full_name == patient_full_name}
                if patient_full_name == current_patient.full_name
                   patient == current_patient
                
                        patient != nil
                        patient_menu = prompt.select("Would you like to add log or read log?") do |menu|
                        menu.choice "Add"
                        menu.choice "Read"
                        menu.choice "Exit"   
                        end 
                #         patient_list << patient
                # CSV.open("Patients.csv", "a") do |csv| 
                #     csv << ["#{patient_full_name}", "#{patient_species}", "#{patient_breed}", "#{patient_age}", "#{patient_sex}"
                        if patient_menu == "Add"
                        temp = prompt.ask("Temperature")
                        pulse = prompt.ask("Pulse")
                        resprate = prompt.ask("Resp")
                        pain = prompt.ask("Pain(out of 5)")
                        add_log(temp, pulse,resprate, pain)
                        
                    elsif patient_menu == "Read"
                            read_log("belle.txt")
                    
                        end
                    
                else
                    puts "Access Denied"
                end
            elsif main_menu == "Add Patient"
                patient_full_name= prompt.ask("Patient Full Name")
                patient_species= prompt.ask("Patient Species")
                patient_breed= prompt.ask("Patient Breed")
                patient_age= prompt.ask("Patient Age")
                patient_sex= prompt.ask("Patient Sex")
                patient = Patient.new(patient_full_name, patient_species, patient_breed, patient_age, patient_sex)
                patient_list << patient
                CSV.open("Patients.csv", "a") do |csv| 
                    csv << ["#{patient_full_name}", "#{patient_species}", "#{patient_breed}", "#{patient_age}", "#{patient_sex}"]   
                end    
                puts "Thank you, #{patient_full_name} has been added to the system"
            elsif patient_menu == "Exit"
            puts "Thank you #{user_name}, you have now logged out"
            user = nil
            system("clear")
            puts ""
            break
            else 
            puts "why"
            end
        end
        
    end

