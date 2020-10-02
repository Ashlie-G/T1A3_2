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

end