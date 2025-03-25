class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :workouts, dependent: :destroy
  has_many :exercises, dependent: :destroy

  has_many :likes_workout, dependent: :destroy
  has_many :likes, through: :likes_workout, source: "workout"
end
