class Image < ActiveRecord::Base
  belongs_to :user
  has_attached_file :photo, :styles => {:small => "100x100#", :large => "650x650>"}
  validates_attachment_presence :photo
  validates :name, presence: true
  validates :caption, presence: true
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

end
