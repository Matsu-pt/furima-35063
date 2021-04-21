require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_delivery = FactoryBot.build(:purchase_delivery, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@purchase_delivery).to be_valid
      end
      it '建物が空でも登録できる' do
        @purchase_delivery.build = ''
        expect(@purchase_delivery).to be_valid
      end
    end

    context '内容に問題があるとき' do
      it 'user_idがnilの時' do
        @purchase_delivery.user_id = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idがnilの時' do
        @purchase_delivery.item_id = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号にハイフンがないとき' do
        @purchase_delivery.postal_code = '1234567'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号の記載がないとき' do
        @purchase_delivery.postal_code = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県の記載が適切でないとき' do
        @purchase_delivery.shipping_area_id = 1
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it '市区町村の記載がないとき' do
        @purchase_delivery.municipality = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地の記載がないとき' do
        @purchase_delivery.address = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号の記載がないとき' do
        @purchase_delivery.phone_number = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が11桁より大きい場合' do
        @purchase_delivery.phone_number = '123456789012'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号にハイフンが使用している場合' do
        @purchase_delivery.phone_number = '1234-567890'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空だと登録できない' do
        @purchase_delivery.token = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
