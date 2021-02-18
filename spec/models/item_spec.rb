require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能が保存できる場合' do
    it 'image.name.item_description.category_id.item_condition_id.cost_id.prefecture_id.day_id.priceがあれば保存できる' do
      expect(@item).to be_valid
    end
  end

  describe '商品出品機能が保存できない場合' do
    it 'imageがなければ出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'itemがないと出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'item_descriptionがないと出品できない' do
      @item.item_description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item description can't be blank")
    end
    it 'category_idがないと出品できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'category_idが1を選択している場合は出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it 'item_condition_idがないと出品できない' do
      @item.item_condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition can't be blank")
    end
    it 'item_condition_idが1を選択している場合は出品できない' do
      @item.item_condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Item condition must be other than 1')
    end
    it 'cost_idがないと出品できない' do
      @item.cost_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Cost can't be blank")
    end
    it 'cost_idが1を選択している場合は出品できない' do
      @item.cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Cost must be other than 1')
    end
    it 'prefecture_idがないと出品できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idが1を選択している場合は出品できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'day_idがないと出品できない' do
      @item.day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank")
    end
    it 'day_idが1を選択している場合出品できない' do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Day must be other than 1')
    end
    it 'priceがない出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが全角数字だと出品できない' do
      @item.price = '１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end

    it 'priceが半角英数混合ではできない' do
      @item.price = '111aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end

    it 'priceが半角英語だけではできない' do
      @item.price = 'aaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end

    it 'priceが300円以下だとだと出品できない' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it 'priceが10000000円以上だと出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
  end
end