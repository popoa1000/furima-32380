require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'product,description,category_id,condition_id,charge_id,shipment_id,day_id,price,imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it '商品名が空では出品できない' do
        @item.product = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Product can't be blank")
      end
      it '商品説明が空では出品できない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Description can't be blank")
      end
      it 'カテゴリーが空では出品できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end
      it 'カテゴリーのidが1以下では出品できない' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category Select")
      end
      it '商品状態が空では出品できない' do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition can't be blank")
      end
      it '商品状態のidが1以下では出品できない' do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition Select")
      end
      it '配送料の負担が空では出品できない' do
        @item.charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Charge can't be blank")
      end
      it '配送料の負担のidが1以下では出品できない' do
        @item.charge_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Charge Select")
      end
      it '発送元の地域が空では出品できない' do
        @item.shipment_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipment can't be blank")
      end
      it '発送元の地域のidが1以下では出品できない' do
        @item.shipment_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipment Select")
      end
      it '発送までの日数が空では出品できない' do
        @item.day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Day can't be blank")
      end
      it '発送までの日数のidが1以下では出品できない' do
        @item.day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Day Select")
      end
      it '価格が空では出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end
      it '価格が¥300~¥9,999,999意外では出品できない' do
        @item.price = "999999999"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price Out of setting range")
      end
      it '価格が半角数字以外では出品できない' do
        @item.price = "５０００"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price Out of setting range")
      end
    end
  end
end

