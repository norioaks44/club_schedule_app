class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :grade
  belongs_to :position
  has_many :event
  has_many :reviews

end
