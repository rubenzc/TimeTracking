class Project < ActiveRecord::Base
  
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

end
