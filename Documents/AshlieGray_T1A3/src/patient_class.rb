# frozen_string_literal: true

class Patient
  attr_reader :species, :breed, :age, :sex
  attr_accessor :first_name, :last_name, :patient_log

  def initialize(first_name, last_name, species, breed, age, sex)
    @first_name = first_name
    @last_name = last_name
    @species = species
    @breed = breed
    @age = age
    @sex = sex
    @patient_log = []
  end
end
