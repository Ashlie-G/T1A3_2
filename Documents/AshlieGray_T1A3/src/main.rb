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

user_database = []
# CSV.foreach("Users.csv", headers: true) do |row| 
#     user_database << User.new(row["username"], row["password"])
# end

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


prompt = TTY::Prompt.new

puts "TPRP Monitor"
sleep 1
welcome = prompt.select("Login or Create New") do |menu|
    menu.choice "Login"
    menu.choice "Create Account"
    menu.choice "Exit"   
end


    user = nil
if  welcome == "Create Account"
    user_name= prompt.ask("Enter a username")
    user_password = prompt.mask("Enter a password")
    user = User.new(user_name, user_password)
    user_database << user
    CSV.open("Users.csv", "a") { |csv| csv << ["#{user_name}", "#{user_password}"]}    
    puts "Welcome #{user_name}, you are now logged in"

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
    else
    puts "Goodbye"
        
    end
end
