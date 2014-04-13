class Project < ActiveRecord::Base
  has_many :assignments, dependent: :destroy

  IMAGE_TYPES = %w(image/jpeg image/jpg image/png)

  has_attached_file :image, styles: { small: '100x100', large: '300x300' }
  validates_attachment_content_type :image, content_type: IMAGE_TYPES
  
  validates :name, uniqueness: true, presence: true, length: { maximum: 50 }

  validates :website, length: { maximum: 100 }

  validates :github, length: { maximum: 100 }

  validates :employer, length: { maximum: 50 }

  validates :notes, length: { maximum: 1000 }

  def self.list_by_recent
    order('created_at desc')
  end

  def assignment_total
    assignments.count
  end

  def find_unfinished_assignments
    assignments.select { |assignment| assignment.status =~ /Completed/ }
  end

  def unfinished_assignments_total
    find_unfinished_assignments.count
  end
end
