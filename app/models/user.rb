class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :books, dependent: :destroy
  
  validates :name, uniqueness: true

  def get_profile_image(width, height)
    if profile_image.attached?
     profile_image.variant(resize_to_limit: [width, height]).processed
    else
    'no_image.jpg'
    end
  end

  validates :name,
    presence: true,
    uniqueness: {case_sensitive: false},
    length: {minimum: 2, maximum: 20}

  validates :introduction,
    length: {maximum: 50}


end
