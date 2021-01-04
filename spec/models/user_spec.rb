require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録が可能なとき' do
      it 'name, email, password, password_confirmation, grade_id, position_idがあるとき登録できる' do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録が不可能なとき' do
      it 'nicknameが空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it '名前は全角でなければ登録できない' do
        @user.name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name enter in full characters')
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@が含まれていなければ登録できない' do
        @user.email = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空だと登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password include both letters and numbers')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password include both letters and numbers')
      end
      it '入学期が空だと登録できない' do
        @user.grade_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Grade can't be blank")
      end
      it 'ポジションが空だと登録できない' do
        @user.position_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Position can't be blank")
      end

    end

  end
end
