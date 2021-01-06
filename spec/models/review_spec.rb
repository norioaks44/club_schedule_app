require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end

  describe '試合レビュー新規登録' do
    context '新規登録が可能なとき' do
      it '試合日, 試合ジャンル, 対戦相手, レビュー本文, 試合動画URL,があるとき登録できる' do
        expect(@review).to be_valid
      end
      it '試合動画URLが空でも登録できる' do
        @review.match_url = nil
        expect(@review).to be_valid
      end
    end

    context '新規登録が不可能なとき' do
      it 'タイトルが空のとき登録できない' do
        @review.match_date = nil
        @review.valid?
        expect(@review.errors.full_messages).to include "Match date can't be blank"
      end
      it '試合ジャンルが空のとき登録できない' do
        @review.match_genre_id = nil
        @review.valid?
        expect(@review.errors.full_messages).to include "Match genre can't be blank"
      end
      it '対戦相手が空のとき登録できない' do
        @review.opponent_team = ''
        @review.valid?
        expect(@review.errors.full_messages).to include "Opponent team can't be blank"
      end
      it '試合レビューが空のとき登録できない' do
        @review.comment = ''
        @review.valid?
        expect(@review.errors.full_messages).to include "Comment can't be blank"
      end
      it '試合レビューが1001文字以上のとき登録できない' do
        @review.comment = Faker::Lorem.characters(number: 1001)
        @review.valid?
        expect(@review.errors.full_messages).to include 'Comment is too long (maximum is 1000 characters)'
      end
      it '参考動画にURLではなく違う文字列を入力しても登録できない' do
        @review.match_url = 'testtest'
        @review.valid?
        expect(@review.errors.full_messages).to include 'Match url enter the URL'
      end
    end
  end
end
