require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存 ' do
    context '商品が投稿できる場合' do
      it 'user_id,画像、商品名、説明文、カテゴリー、状態、発送までの日数、発送元の地域、配送料の負担、販売価格があれば投稿できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が投稿できない場合' do
      it '出品画像が空では投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image を選択して下さい")
      end
      it '商品名が空では投稿できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では投稿できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it '商品カテゴリーの選択が適切で無いと投稿できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を選択して下さい')
      end
      it '商品の状態の選択が適切で無いと投稿できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status を選択して下さい')
      end
      it '発送までの日数の選択が適切で無いと投稿できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day を選択して下さい')
      end
      it '発送元の地域の選択が適切で無いと投稿できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area を選択して下さい')
      end
      it '配送料の負担の選択が適切で無いと投稿できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee を選択して下さい')
      end
      it '販売価格が空だと投稿できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が300より小さいと投稿できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300~9,999,999の範囲内で入力して下さい')
      end
      it '販売価格が9999999より大きいと投稿できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300~9,999,999の範囲内で入力して下さい')
      end
      it '販売価格が整数でなければ登録できない' do
        @item.price = 350.5
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300~9,999,999の範囲内で入力して下さい')
      end
      it '販売価格が全角では登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300~9,999,999の範囲内で入力して下さい'),('Price は半角英数字で入力して下さい')
      end
      it 'userが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
