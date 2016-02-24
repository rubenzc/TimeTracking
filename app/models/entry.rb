class Entry < ActiveRecord::Base
  validates :hours, :minutes, numericality: true
  validates :hours, :minutes, :date, presence: true
  #Con el de abajo chequeas si está asociado a un proyecto
  validates :project_id, presence:true

  belongs_to :project
end
