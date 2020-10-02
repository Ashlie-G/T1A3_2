class Patient
    attr_reader :species, :breed, :age, :sex
    attr_accessor :full_name, :patient_log
    
    def initialize(full_name, species, breed, age, sex)
        @full_name = full_name
        @species =species
        @breed = breed
        @age = age
        @sex = sex
        @patient_log = []
        
    end

    # def add_log(patient, temperature, pulse, respiration, user)
    #     @patient_log = temperature, pulse, respiration
    #     CSV.open("#{patient}.csv", "a") do |csv|
    #     csv << ["#{temperature}" + "°C" + " ", "#{pulse}" + "bpm" + " ", "#{respiration}" + "brpm", "#{user}", "#{Time.now}"]
    #     end   
    # end

    # def view_log(patient) 
    # @patient_log = []
    # @patient_log =CSV.parse(File.read("#{patient}.csv"))
    # normalrange = TTY::Table.new(["Temp","Pulse","Resp Rate", "User", "Time & Date"], @patient_log.to_a)
    # puts normalrange.render(:ascii)  
    # end

end