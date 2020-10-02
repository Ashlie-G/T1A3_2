#method to view log
def view_log(patient) 
    @patient_log =CSV.parse(File.read("#{patient}.csv"))
    normalrange = TTY::Table.new(["Temp","Pulse","Resp Rate", "User", "Time & Date"], @patient_log.to_a)
    puts normalrange.render(:ascii, alignments: [:center, :right])  
end

#add log method
def add_log(patient, temperature, pulse, respiration, user)
    @patient_log = temperature, pulse, respiration
    CSV.open("#{patient}.csv", "a") do |csv|
    csv << ["#{temperature}" + "°C" + " ", "#{pulse}" + "bpm" + " ", "#{respiration}" + "brpm", "#{user}", "#{Time.now}"]
    #csv << ["#{user}", Time.now]
    end   
end

#title banner
def title_screen
    title =File.read("title.txt")
    puts title
end
user_list = []
patient_list = []
@patient_log = []

#command line help menu
def process_argv(option)
    case option
    when "-h"
        puts "Welcome to the help menu".colorize(:magenta)
        puts "Please create a username and password to login if you dont have an existing account".colorize(:light_blue)
        puts "To navigate the app, please use the scrolling menu to select what you would like to do".colorize(:light_blue)
        puts "If you are unsure of the normal parameters for the patient you are examining, please see the help menu in tha patient section".colorize(:light_blue)
        puts "Press Control+C to exit the app at anytime".colorize(:light_blue)
        puts "Thank you for visiting the help menu".colorize(:magenta)
        exit
        
    end
end

@options = {}

ARGV.each{ |opt| process_argv(opt) }