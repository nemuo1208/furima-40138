class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :nickname, presence: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'を入力してください' }
  validates :last_name_zen, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'を入力してください' }
  validates :first_name_zen, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'を入力してください' }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'を入力してください' }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'を入力してください' }
  validates :birthday, presence: true


  has_many :products_informations
  has_many :purchases_records

end
