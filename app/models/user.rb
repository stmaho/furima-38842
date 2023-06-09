class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX
  
  has_many :items
  has_many :orders
        
  validates :nickname, presence: true
  validates :birth_day, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
    validates :family_name, presence: true
    validates :first_name, presence: true
  end
  
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/} do
    validates :read_family, presence: true
    validates :read_first, presence: true
  end
  
end
