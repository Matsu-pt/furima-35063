class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:validatable


  with_options presence: true do
    validates :nickname, :first_name, :family_name, :first_name_ruby, :family_name_ruby, :birth_day
  end

  with_options format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }, allow_blank: true do
    validates :first_name
    validates :family_name
  end
  with_options format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/ }, allow_blank: true do
    validates :first_name_ruby
    validates :family_name_ruby
  end
  validates :password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
end
