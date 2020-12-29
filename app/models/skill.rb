class Skill < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :genre

  has_one_attached :video
  has_one_attached :image

  with_options presence: true do
    validates :drill_name
    validates :info
    validates :category_id, numericality: { other_than: 1 } 
    validates :genre_id, numericality: { other_than: 1 } 
  end
  
  validates :image, file_content_type: { allow: [
    'image/jpeg', 
    'image/jpg', 
    'image/png', 
    'image/bmp', 
    'image/gif'
    ]}
    
  validates :video, file_content_type: {allow: [
    'video/mp4',
    'video/mov',
    'video/quicktime']}

end
