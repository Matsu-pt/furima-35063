class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    with_options format: { with:/\A(?:\p{Hiragana}|\p{Katakana}|[一-龠々])+\z/} do
      validates :first_name
      validates :family_name
    end
    with_options format: { with:/[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/} do
      validates :first_name_ruby
      validates :family_name_ruby
    end
    validates :birth_day
  end

  validates :encrypted_password, format: { with:/\A[a-z0-9]+\z/i}
end
