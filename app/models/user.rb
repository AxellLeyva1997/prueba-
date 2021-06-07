class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles #el inverso de belongs_to
  has_one_attached :avatar

  def obtener_avatar
    if self.avatar.attached?
      self.avatar
    else
      return "user.png"
    end
  end
end
