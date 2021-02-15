require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', encrypted_password: '000000', family_name: 'aaaaaa', first_name: 'bbbbbb', family_name_kana: 'ああああああ', first_name_kana: 'いいいいいい', birth_day: '21/2/12')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: '名無さん', email: '', encrypted_password: '000000', family_name: 'aaaaaa', first_name: 'bbbbbb', family_name_kana: 'ああああああ', first_name_kana: 'いいいいいい', birth_day: '21/2/12')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'encypted_passwordが空では登録できない' do
      user = User.new(nickname: '名無さん', email: 'test@example', encrypted_password: '', family_name: 'aaaaaa', first_name: 'bbbbbb', family_name_kana: 'ああああああ', first_name_kana: 'いいいいいい', birth_day: '21/2/12')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'family_nameが空では登録できない' do
      user = User.new(nickname: '名無さん', email: 'test@example', encrypted_password: '000000', family_name: '', first_name: 'bbbbbb', family_name_kana: 'ああああああ', first_name_kana: 'いいいいいい', birth_day: '21/2/12')
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      user = User.new(nickname: '名無さん', email: 'test@example', encrypted_password: '000000', family_name: 'aaaaaa', first_name: '', family_name_kana: 'ああああああ', first_name_kana: 'いいいいいい', birth_day: '21/2/12')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
     end
  end
