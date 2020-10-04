require 'colorize'
require 'tty-prompt'
require 'tty-table'
require 'csv'
require_relative 'user_class'
require_relative 'patient_class'
require_relative 'methods'

# databases
user_list = []
patient_list = []

# Main
title_screen
prompt = TTY::Prompt.new(active_color: :magenta, interrupt: :exit)
#user database file
begin
  CSV.foreach("Users.csv", headers: true) do |row|
    user_list << User.new(row["username"], row["password"])
  end
rescue (Errno::ENOENT)
  puts "No user's on file, please create account".colorize(:red)
end

patient = nil
user = nil
#opening menu
loop do
  welcome = prompt.select("Login or Create New", help: "(Case Sensative)", show_help: :always) do |menu|
    menu.choice "Login"
    menu.choice "Create Account"
    menu.choice "Exit"
  end
  system("clear")
  title_screen
#create new user
  if welcome == "Create Account"
    user_name = prompt.ask("Enter a username", required: true)
    user_password = prompt.mask("Enter a password", required: true) 
    current_user = User.new(user_name, user_password)
    user_list << user
    CSV.open("Users.csv", "a") { |csv| csv << [current_user.username.to_s, current_user.password.to_s] }
    puts "Thank you #{current_user.username}, you are now logged in and have been added to the system".colorize(:magenta)
    sleep 1.5
    system("clear")
    title_screen
#user login
  elsif welcome == "Login"
    begin
    username = prompt.ask("Enter username", required: true)
    current_user = user_list.find { |user| user.username == username }
    if username == current_user.username
      password = prompt.mask("Enter your password", required: true)
      if password == current_user.password
        user = current_user
        puts "Welcome #{current_user.username}".colorize(:magenta)
      else
        puts "Invalid username, please run the app again with correct username or create a new account (./run_tpr.sh)".colorize(:red)
        break
      end
    else
      puts "Invalid password, please run the app again with correct username or create a new account (./run_tpr.sh)".colorize(:red)
      break
    end
    rescue StandardError
      puts "Something went wrong, please run the app again with correct username or create a new account (./run_tpr.sh)".colorize(:red)
      break
  end
  sleep 1.5
    system("clear")
    title_screen
#Exit app
  elsif welcome == "Exit"
    puts "Thankyou for using the TPR Tracker".colorize(:magenta)
    user = nil
    break
  else
    puts "invalid Input".colorize(:red)
    break
  end
#patient database file
  begin
    CSV.foreach("Patients.csv", headers: true) do |row|
      patient_list << Patient.new(row["first_name"], row["last_name"], row["species"], row["breed"], row["age"], row["sex"])
    end
  rescue (Errno::ENOENT)
    puts "No patient's on file, please create patient profile".colorize(:red)
  end
#main menu
  loop do
    main_menu = prompt.select("What would you like to do?", help: '(Case Sensative)', show_help: :always) do |menu|
      menu.choice "Find Patient"
      menu.choice "Add Patient"
      menu.choice "Help"
      menu.choice "Exit"
    end
#find/search for patient
    if main_menu == "Find Patient"
      patient_name = prompt.ask("Patient Name", required: true)
      current_patient = patient_list.find { |patient| patient.first_name == patient_name }
      begin
        if patient_name == current_patient.first_name
          patient_lastname = prompt.ask("Patient Last Name", required: true)
          if patient_lastname == current_patient.last_name
            patient = current_patient
            puts "#{current_patient.first_name} #{current_patient.last_name} is #{current_patient.species}, is a #{current_patient.breed}, is #{current_patient.age} years old and is #{current_patient.sex}".colorize(:light_blue)
            loop do
#patient menu
              !patient.nil?
              patient_menu = prompt.select("Would you like to add log or view log?") do |menu|
                menu.choice "Add"
                menu.choice "View"
                menu.choice "Help (Normal Ranges)"
                menu.choice "Exit Patient Menu"
              end
#add to patient log
              if patient_menu == "Add"
                temp = prompt.ask("Temperature", convert: :float, required: true){ |q| q.in("0-100") }
                pulse = prompt.ask("Pulse", convert: :int, required: true){ |q| q.in("0-300") }
                resprate = prompt.ask("Resp", convert: :int, required: true){ |q| q.in("0-100") }
                patient = current_patient.first_name
                user = current_user.username
                add_log(patient, temp, pulse, resprate, user)
              elsif patient_menu == "View"
                begin
                    patient = current_patient.first_name
                    view_log(patient)
                rescue StandardError
                  puts "no record yet, please add log".colorize(:red)
                  end
#patient help menu                  
              elsif patient_menu == "Help (Normal Ranges)"
                puts "Normal ranges are:"
                normalrange = TTY::Table.new(["Dog", "Cat", "Guinea Pig"], [["Temp - 38.4-39.1", "Temp - 38.2-38.6", "Temp -37.2 -39.5"], ["Pulse - 60-180 bpm", "Pulse - 120-220 bpm", "Pulse - 230 -380 bpm"], ["Resp Rate - 10-30 brpm", "Resp Rate - 24-42 brpm", "Resp Rate -42 -104brpm"]])
                puts normalrange.render(:ascii)
                puts "bpm = beats per minute\nbrpm = breaths per minute".colorize(:magenta)
#exit patient menu
              else patient_menu == "Exit Patient Menu"
                   patient = nil
                   break
              end
            end
          else
            puts "Last name invalid".colorize(:red)
            sleep 1.5
          end
        else
          puts "Invalid".colorize(:red)
          sleep 1.5
        end
      rescue StandardError
        puts "Patient not found, please try again or add a new patient file".colorize(:red)
        sleep 1.5
      end
      sleep 0.5
      system("clear")
      title_screen
#create new patient file      
    elsif main_menu == "Add Patient"
      patient_name = prompt.ask("Patient First Name", required: true)
      patient_last_name = prompt.ask("Patient Last Name", required: true)
      patient_species = prompt.ask("Patient Species", required: true)
      patient_breed = prompt.ask("Patient Breed", required: true)
      patient_age = prompt.ask("Patient Age", convert: :int, required: true) { |q| q.in("0-30") }
      patient_sex = prompt.ask("Patient Sex", required: true)
      patient = Patient.new(patient_name, patient_last_name, patient_species, patient_breed, patient_age, patient_sex)
      patient_list << patient
      CSV.open("Patients.csv", "a") do |csv|
        csv << [patient_name.to_s, patient_last_name.to_s, patient_species.to_s, patient_breed.to_s, patient_age.to_s, patient_sex.to_s]
      end
      puts "Thank you, #{patient_name} has been added to the system".colorize(:magenta)
      sleep 1.5
      system("clear")
      title_screen
#help menu
    elsif main_menu == "Help"
      puts "The TPRP Monitor allows you to easily log the temperature, pulse and respiration rate of your patients".colorize(:magenta)
      puts "Use the up and down arrows to navigate the menu".colorize(:light_blue)
      puts "Press control + c to cancel running the app at anytime".colorize(:light_blue)
#exit/logout of app        
    else main_menu == "Exit"
         puts "Thank you #{current_user.username}, you have now logged out".colorize(:magenta)
         sleep 1
         user = nil
         system("clear")
         title_screen
         break
    end
  end
end
