require 'colorize'
require 'colorized_string'
require 'tty-prompt'
require 'tty-table'
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
#attempt to move data to csv's
def view_log 
        plog = CSV.parse(File.read("angus.csv"), headers: true)
    #    table = TTY::Table.new
    #    table << plog
    #    puts table.render(:ascii)
       puts plog
       
    #    CSV.foreach("angus.csv") do |row|

end

def add_log(temperature, pulse, respiration)
        @patient_log = temperature, pulse, respiration
    CSV.open("angus.csv", "a") do |csv|
        csv << ["Temp", "Pulse", "Resp Rate"]
        csv << [temperature, pulse, respiration]
        csv << ["#{@username}", Time.now]
    end
    
     
     
end
# table = TTY::Table.new
# table << ["a1","a2"]
# table << ["b1","b2"]

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
prompt = TTY::Prompt.new(active_color: :cyan)

puts "Welcome to the TPR Monitor".colorize(:red)
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
                    begin
                        if username == current_user.username
                            password = prompt.mask('Enter your password')
                            if password == current_user.password
                                user == current_user
                            else
                                puts "Invalid username"
                            end 
                        else
                            puts "Invalid password"
                        end
                    rescue
                        puts "User does not exist"
                        break
                    end
        elsif welcome == "Exit"
              puts " Thankyou for using the TPRP Monitor"
              user = nil
            break
        else
            puts "invalid Input"
            
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
                begin    
                    if patient_full_name == current_patient.full_name
                       patient == current_patient
                
                        patient != nil
                        patient_menu = prompt.select("Would you like to add log or view log?") do |menu|
                        menu.choice "Add"
                        menu.choice "View"
                        menu.choice "Help (Normal Ranges)"
                        menu.choice "Exit Patient Menu"   
                        end 
                      #patient_list << patient
                       # CSV.open("Patients.csv", "a") do |csv| 
                        #csv << ["#{patient_full_name}", "#{patient_species}", "#{patient_breed}", "#{patient_age}", "#{patient_sex}"
                        if  patient_menu == "Add"
                            temp = prompt.ask("Temperature")
                            pulse = prompt.ask("Pulse")
                            resprate = prompt.ask("Resp")
                            add_log(temp, pulse,resprate)
                        
                        elsif patient_menu == "View"
                              view_log

                        elsif patient_menu == "Help (Normal Ranges)"
                            puts "normal ranges are:"
                            normalrange = TTY::Table.new(["Dog","Cat","Guinea Pig"], [["Temp - 38.4-39.1", "Temp - 38.2-38.6", "Temp -37.2 -39.5"], ["Pulse - 60-180 bpm", "Pulse - 120-220 bpm", "Pulse - 230 -380 bpm"], ["Resp Rate - 10-30 brpm", "Resp Rate - 24-42 brpm", "Resp Rate -42 -104brpm"]])
                            puts normalrange.render(:ascii)
                            puts "bpm = beats per minute\nbrpm = breaths per minute"
                        else patient_menu == "Exit Patient Menu"
                            puts "Goodbye"
                        break    
                    
                        end
                
                    else
                        puts "Invalid"
                
                    end
                rescue
                    puts "Patient not found"   
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
            
            elsif main_menu == "Help"
                puts "The TPRP Monitor allows you to easily log the temperature, pulse rate\nrespiration rate and pain score of your patients"
                puts "Use the up and down arrows to navigate the menu"
            break       

            else patient_menu == "Exit"
                puts "Thank you #{user_name}, you have now logged out"
                sleep 5
                user = nil 
            break
            end
       
        end
    end    

