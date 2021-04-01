require 'rails_helper'

RSpec.describe BuyerOrder, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @buyer_order = FactoryBot.build(:buyer_order, user_id: @user.id, item_id:@item.id)
      sleep 0.3
    end

    context '購入がうまくいくとき' do
      it 'postal_code, shipment_id, municipality, address, building, phone_number,
          user_id, item_id, tokenが存在すれば購入できる' do
        expect(@buyer_order).to be_valid
      end
      it '建物名がなくても購入できる' do
        @buyer_order.building = ''
        expect(@buyer_order).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it '郵便番号が空では購入できない' do
        @buyer_order.postal_code = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと購入できない' do
        @buyer_order.postal_code = '1234567'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号が全角数字だと購入できない' do
        @buyer_order.postal_code = '１２３４５６７'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号が半角英数字混合だと購入できない' do
        @buyer_order.postal_code = 'l2345b7'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号が半角英字だと購入できない' do
        @buyer_order.postal_code = 'OlZbqSo'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県がないと購入できない' do
        @buyer_order.shipment_id = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Shipment can't be blank")
      end
      it '市区町村がないと購入できない' do
        @buyer_order.municipality = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地がないと購入できない' do
        @buyer_order.address = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がないと購入できない' do
        @buyer_order.phone_number = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると購入できない' do
        @buyer_order.phone_number = '090-1234-5678'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が全角数字だと購入できない' do
        @buyer_order.phone_number = '０１２３４５６７８９'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が半角英数字混合では購入できない' do
        @buyer_order.phone_number = 'ol2345678a'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が半角英語では購入できない' do
        @buyer_order.phone_number = 'oqolllloqbb'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が9桁以下では購入できない' do
        @buyer_order.phone_number = '090123456'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上では購入できない' do
        @buyer_order.phone_number = '090123456789'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'クレジット情報のtokenがないと購入できない' do
        @buyer_order.token = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
