#method to view log
def view_log(patient) 
    @patient_log =CSV.parse(File.read("#{patient}.csv"))
    normalrange = TTY::Table.new(["Temp","Pulse","Resp Rate", "User", "Time & Date"], @patient_log.to_a)
    puts normalrange.render(:ascii)  
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