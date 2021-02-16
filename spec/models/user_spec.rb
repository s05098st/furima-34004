require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'nickname,email,passwordとpassword_confirmation,frist_name,family_name,first_name_kana,family_name_kana,birth_dayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameがないと登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空だと登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@が含まれない場合は保存できない' do
      @user.email = 'hogehoge.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid') 
    end

    it '登録済みのemailは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordがないと登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが５文字以下は登録できない' do
      @user.password = '1111a'
      @user.password_cofirmation = '1111a' 
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが数字だけだと登録できない' do
      @user.password = '111111'
      @user.password_cofirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが英語だけだと登録できない' do
      @user.password = 'aaaaaa'
      @user.password_cofirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが存在してもpassword_confirmationが空だと登録できない' do
      @user.password_cofirmation = ''
      @user.valid?
      expect(@user.errors.full_messages.to include("Password confirmation doesn't match Password")
    end

    it 'passwordとpassword_confirmationが異なると登録できない' do
      @user.password = 'inu1'
      @user.password_cofirmation = 'inu2'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'first_nameが空だと登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end

    it 'family_nameが空だと登録できない' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it 'family_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.family_name = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it 'first_name_kanaがないと登録できない' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

      it 'first_name_kanaが全角（カタカナ）でないと登録できない' do 
        @user.first_name_kana = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
      end

      it 'family_name_kanaがないと登録できない' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'family_name_kanaが全角（カタカナ）でないと登録できない' do
        @user.family_name_kana = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana Full-width katakana characters')
      end

      it 'birth_dayがないと登録できない' do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end