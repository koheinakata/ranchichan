class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :text, presence: true
  mount_uploader :folderimage, ImageUploader
end
