class Task < ActiveRecord::Base
  belongs_to :user

  validates :description, presence: true, length: { maximum: 50 }
  
  def self.no_deadline
    where('deadline is NULL')
  end

  def self.pending
    where('completed is NULL')
  end
end
