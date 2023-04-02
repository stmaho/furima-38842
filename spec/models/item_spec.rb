require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品新規登録' do
    context '商品登録ができるとき' do
      it '商品名・商品説明・価格・カテゴリ・商品状態・商品コスト・出品地域・準備日数・画像が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品登録ができないとき' do
      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include"Name can't be blank"
      end
      it '商品説明が空では登録できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include"Content can't be blank"
      end
      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include"Price can't be blank"
      end
      it '価格が299円以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include"Price must be greater than or equal to 300"
      end
      it '価格が10000000円以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include"Price must be less than or equal to 9999999"
      end
      it '価格は半角数字のみが入力可能であること' do
        @item.price = '００００'
        @item.valid?
        expect(@item.errors.full_messages).to include"Price is not a number"
      end

      it 'カテゴリが空では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include"Category can't be blank"
      end
      it ' 商品状態が空では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include"Condition can't be blank"
      end
      it '出品費用が空では登録できない' do
        @item.shopping_cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include"Shopping cost can't be blank"
      end
      it '出品地域が空では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include"Prefecture can't be blank"
      end
      it '出品準備日数が空では登録できない' do
        @item.preparation_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include"Preparation can't be blank"
      end
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include"Image can't be blank"
      end
    end
  end

end












