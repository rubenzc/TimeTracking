class Project < ActiveRecord::Base
has_many :entries

  def self.iron_find(id)
    #Project.
    where(id: id).first
  end

  def self.clean_old
    where('created_at < ?', Time.now - 1.week).destroy_all
  end

  def self.last_created_projects(number)
    order(created_at: :desc).limit(number)
  end

  #Método que nos devuelve la suma de horas trabajadas
  def total_hours_in_month(month, year)
    from = Date.new(year, month, 1)
    to = from.end_of_month
    
    entries = self.entries.where(date: from..to)
    # Crea un array y te suma todas las horas de cada uno de
    # los elementos del array
    entries.to_a.sum(&:hours)
  end
end
