require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入ができるとき' do
      it '郵便番号,都道府県,市町村区,番地,電話番号が存在すれば購入ができる'do
        expect(@order).to be_valid
      end
      it '建物名は空でも購入ができる'do
        @order.address2 = ''
        expect(@order).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it '郵便番号が空では購入ができない'do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Post code can't be blank"
      end
      it '郵便番号は「3桁ハイフン4桁」のみ保存可能なこと'do
        @order.post_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include "Post code is invalid. Include hyphen(-)"
      end
      it '郵便番号は半角数値のみ保存可能なこと'do
        @order.post_code = '１２３−４５６７'
        @order.valid?
        expect(@order.errors.full_messages).to include "Post code is invalid. Include hyphen(-)"
      end
      it '都道府県が空では購入ができない'do
        @order.prefecture_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '市町村区が空では購入ができない'do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "City can't be blank"
      end
      it '番地が空では購入ができない'do
        @order.address1 = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Address1 can't be blank"
      end
      it '電話番号が空では購入ができない'do
        @order.phon_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Phon number can't be blank"
      end
      it '電話番号が12桁だと保存できないこと' do
        @order.phon_number = '000000000000'
        @order.valid?
        expect(@order.errors.full_messages).to include "Phon number is invalid"
      end
      it '電話番号が9桁以下だと保存できないこと' do
        @order.phon_number = '000000000'
        @order.valid?
        expect(@order.errors.full_messages).to include "Phon number is invalid"
      end
      it '電話番号は半角数値のみ保存可能なこと'do
        @order.phon_number = '０００００００００００'
        @order.valid?
        expect(@order.errors.full_messages).to include "Phon number is invalid"
      end
      it 'tokenが空だと購入できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Token can't be blank"
      end
      
      it 'userが紐づいていなければ購入ができない'do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていなければ購入ができない'do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      
    end


  end
end
