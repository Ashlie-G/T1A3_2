#!/usr/bin/env ruby
require 'colorize'
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

def view_log(patient) 

    @patient_log =CSV.parse(File.read("#{patient}.csv"))
    normalrange = TTY::Table.new(["Temp","Pulse","Resp Rate", "User"], @patient_log.to_a)
    puts normalrange.render(:ascii)
    # ["Temp - 38.4-39.1", "Temp - 38.2-38.6", "Temp -37.2 -39.5"], ["Pulse - 60-180 bpm", "Pulse - 120-220 bpm", "Pulse - 230 -380 bpm"], ["Resp Rate - 10-30 brpm", "Resp Rate - 24-42 brpm", "Resp Rate -42 -104brpm"]])


end

def add_log(patient, temperature, pulse, respiration, user)
    @patient_log = temperature, pulse, respiration
    CSV.open("#{patient}.csv", "a") do |csv|
    csv << [temperature + "°C" + " ", pulse + "bpm" + " ", respiration + "brpm", user]
    #csv << ["#{user}", Time.now]
    end   
end

#title banner
def title_screen
    title =File.read("title.txt")
    puts title
    # https://ascii.co.uk/art/pawprints
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


title_screen
#opening menu
prompt = TTY::Prompt.new(active_color: :magenta)
#loop do
    welcome = prompt.select("Login or Create New", help: "(Case Sensative)", show_help: :always) do |menu|
    menu.choice "Login"
    menu.choice "Create Account"
    menu.choice "Exit"   
    end

    
    patient = nil
    user = nil 

    loop do   
        
        if  welcome == "Create Account"
            user_name= prompt.ask("Enter a username", required: true)
            user_password = prompt.mask("Enter a password", required: true)
            user = User.new(user_name, user_password)
            user_list << user
            user = current_user
            CSV.open("Users.csv", "a") { |csv| csv << ["#{user_name}", "#{user_password}"] } 
            puts "Welcome #{current_user}, you are now logged in".colorize(:magenta)
          
            
            elsif welcome == "Login"
                  username = prompt.ask("Enter username", required: true)
                  current_user = user_list.find{ |user| user.username == username}
                begin
                    if username == current_user.username
                        password = prompt.mask("Enter your password", required: true)
                        if password == current_user.password
                            user = current_user
                            puts "Welcome #{current_user.username}".colorize(:magenta)
                        else
                            puts "Invalid username or password".colorize(:red)
                        break    
                        end 
                    else
                        puts "Invalid username or password".colorize(:red)
                    break    
                    end
                rescue
                    puts "Could not find user, try again or create new user".colorize(:red)
                break    
                end

        elsif welcome == "Exit"
              puts "Thankyou for using the TPR Tracker".colorize(:magenta)
              user = nil
             
            break
        else
            puts "invalid Input"
        break    
        end
    
    
        loop do
            main_menu = prompt.select("What would you like to do?" , help: "(Case Sensative)", show_help: :always) do |menu|
            menu.choice "Find Patient"
            menu.choice "Add Patient"
            menu.choice "Help"
            menu.choice "Exit"   
            end
        
            if main_menu == "Find Patient" 
                patient_full_name= prompt.ask("Patient Full Name", required: true)
                current_patient = patient_list.find{ |patient| patient.full_name == patient_full_name}
                
                begin    
                    if patient_full_name = current_patient.full_name
                       patient = current_patient.full_name
                       puts "#{current_patient.full_name} is a #{current_patient.species} #{current_patient.breed}, is #{current_patient.age} years old and is #{current_patient.sex}".colorize(:light_blue)
                        loop do
                            patient != nil
                            patient_menu = prompt.select("Would you like to add log or view log?") do |menu|
                            menu.choice "Add"
                            menu.choice "View"
                            menu.choice "Help (Normal Ranges)"
                            menu.choice "Exit Patient Menu"   
                            end 
                        
                            if  patient_menu == "Add"
                                temp = prompt.ask("Temperature", required: true)
                                pulse = prompt.ask("Pulse", required: true)
                                resprate = prompt.ask("Resp", required: true)
                                patient = current_patient.full_name
                                user = current_user.username
                                add_log(patient, temp, pulse, resprate, user)
                
                            elsif patient_menu == "View"
                                patient = current_patient.full_name
                                view_log(patient)

                            elsif patient_menu == "Help (Normal Ranges)"
                                puts "Normal ranges are:"
                                normalrange = TTY::Table.new(["Dog","Cat","Guinea Pig"], [["Temp - 38.4-39.1", "Temp - 38.2-38.6", "Temp -37.2 -39.5"], ["Pulse - 60-180 bpm", "Pulse - 120-220 bpm", "Pulse - 230 -380 bpm"], ["Resp Rate - 10-30 brpm", "Resp Rate - 24-42 brpm", "Resp Rate -42 -104brpm"]])
                                puts normalrange.render(:ascii)
                                puts "bpm = beats per minute\nbrpm = breaths per minute"
                            
                            else patient_menu == "Exit Patient Menu"
                                 patient = nil
                        break
                            
                    
                            end
                        end
                    else
                        puts "Invalid"
                
                    end
                rescue
                    puts "Patient not found".colorize(:red)   
                end
            
            elsif main_menu == "Add Patient"
                patient_full_name= prompt.ask("Patient Full Name", required: true)
                patient_species= prompt.ask("Patient Species", required: true)
                patient_breed= prompt.ask("Patient Breed", required: true)
                patient_age= prompt.ask("Patient Age", required: true)
                patient_sex= prompt.ask("Patient Sex", required: true)
                patient = Patient.new(patient_full_name, patient_species, patient_breed, patient_age, patient_sex)
                patient_list << patient
                CSV.open("Patients.csv", "a") do |csv| 
                    csv << ["#{patient_full_name}", "#{patient_species}", "#{patient_breed}", "#{patient_age}", "#{patient_sex}"]   
                end    
                puts "Thank you, #{patient_full_name} has been added to the system".colorize(:magenta)
            
            elsif main_menu == "Help"
                puts "The TPRP Monitor allows you to easily log the temperature, pulse and respiration rate of your patients".colorize(:magenta)
                puts "Use the up and down arrows to navigate the menu".colorize(:light_blue)
                   

            else main_menu == "Exit"
                puts "Thank you #{current_user.username}, you have now logged out".colorize(:magenta)
                sleep 2
                user = nil 
            break    
            end
       
        end
    end
#end    