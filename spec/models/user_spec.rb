require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいく時' do
        it 'name,email,password,password_confirmation,first_name,family_name,first_name_ruby,family_name_rubyが存在すれば登録できる' do
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかない時' do
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordが６字以上でないと登録できない' do
          @user.password = '1234q'
          @user.password_confirmation = '1234q'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it 'passwordが英字だけでは登録できない' do
          @user.password = 'qqqqqq'
          @user.password_confirmation = 'qqqqqq'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it 'passwordが数字だけでは登録できない' do
          @user.password = '111111'
          @user.password_confirmation = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it 'passwordが全角では登録できない' do
          @user.password = 'あいうえおか'
          @user.password_confirmation = 'あいうえおか'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it 'first_nameが空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'first_nameが漢字、平仮名、カタカナ以外で登録できない' do
          @user.first_name = 'abcdef'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end
        it 'family_nameが空では登録できない' do
          @user.family_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end
        it 'family_nameが漢字、平仮名、カタカナ以外で登録できない' do
          @user.family_name = 'efghij'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name is invalid')
        end
        it 'first_name_rubyが空では登録できない' do
          @user.first_name_ruby = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name ruby can't be blank")
        end
        it 'first_name_rubyが半角文字では登録できない' do
          @user.first_name_ruby = 'abcde'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name ruby is invalid")
        end
        it 'first_name_rubyが全角カタカナ以外の全角文字では登録できない' do
          @user.first_name_ruby = 'あ亞'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name ruby is invalid')
        end
        it 'family_name_rubyが空では登録できない' do
          @user.family_name_ruby = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name ruby can't be blank")
        end
        it 'family_name_rubyが半角文字では登録できない' do
          @user.family_name_ruby = 'abcde'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name ruby is invalid')
        end
        it 'first_name_rubyが全角カタカナ以外の全角文字では登録できない' do
          @user.first_name_ruby = 'あ亞'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name ruby is invalid')
        end
        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it '誕生日が空では登録できない' do
          @user.birth_day = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth day can't be blank")
        end
        it 'メールアドレスに＠を含まないと登録できない' do
          @user.email = 'testtest'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
      end
    end
  end
end
