class Note < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
end
