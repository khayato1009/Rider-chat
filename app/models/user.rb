class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :motorcycle_model, presence: true  
  
has_many :user_rooms
has_many :rooms, through: :user_rooms
has_many :messages
end
