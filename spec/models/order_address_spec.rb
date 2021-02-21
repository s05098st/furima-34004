require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @orderaddress = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
    sleep(1)
  end
  describe '商品購入機能で購入できる場合' do
    it '必要事項が全て入力されていたら購入できる' do
      expect(@orderaddress).to be_valid
    end
    it 'prefecture_building以外が記入されていたら購入できる' do
      expect(@orderaddress).to be_valid
    end
  end

  describe '商品購入機能で購入できない場合' do
    it 'post_codeがないと購入できない' do
      @orderaddress.post_code = nil 
      @orderaddress.valid?

      expect(@prderaddress.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeにハイフンが入っていないと購入できない' do
      @orderaddress.post_code = "1111111"
      @orderaddress.valid?

      expect(@orderaddress.errors.full_messages).to include("Post code Input correctly")
    end

    it 'prefecture_idで１を選択していると購入できない' do
      @orderaddress.prefecture_id = 1
      @orderaddress.valid?

      expect(@orderaddress.errors.full_messages).to include("Prefecture status Select")
    end

    it 'prefecture_idが空だと購入できない' do
      @orderaddress.prefecture_id = nil
      @orderaddress.valid?

      expect(@orderaddress.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'prefecture_cityが空だと入力できない' do
      @orderaddress.prefecture_city = nil
      @orderaddress.valid?

      expect(@orderaddress.errors.full_messages).to include("Prefecture city can't be blank")
    end

    it 'prefecture_blockが空だと入力できない' do
      @prderaddress.prefecture_block = nil
      @orderaddress.valid?

      expect(@orderaddress.errors.full_messages).to include("Prefecture_block can't be blank")
    end

    it 'phone_numberが空だと入力できない' do
      @orderaddress.phone_number = nil
      @orderaddress.valid?

      expect(@orderaddress.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_nubmerが全角英数字混合だと購入できない' do
      @orderaddress.phone_number = "１２３４５６７８９12"
      @orderaddress.valid?

      expect(@orderaddress.errors.full_messages).to include("Phone number Input only number")
    end

    it 'phone_numberに全角半角英数字が入っていると購入できない' do
      @orderaddress.phone_number = "abAB１２３４５６７"
      @orderaddress.valid?

      expect(@orderaddress.errors.full_messages).to include("Phone number Input only number")
    end

    it 'phone_number全角半角（漢字、平仮名、カタカナ）が入っていると購入できない' do
      @orderaddress.phone_number = "１２３４５あかさたな"
      @orderaddress.valid?

      expect(@orderaddress.errors.full_messages).to include("Phone number Input only number")
    end

    it 'user_idがないと購入できない' do
      @orderaddress.user_id = nil
      @orderaddress.valid?

      expect(@orderaddress.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idがない場合購入できない' do
      @orderaddress.item_id = nil
      @orderaddress.valid?

      expect(@orderaddress.errors.full_messages).to include("Item can't be blank")
    end
  end
end