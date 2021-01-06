require 'rails_helper'

RSpec.describe Skill, type: :model do
  before do
    @skill = FactoryBot.build(:skill)
    @skill.image = fixture_file_upload('public/images/test_image.png')
    @skill.video = fixture_file_upload('public/videos/test_video.mp4')
  end

  describe '解説新規登録' do
    context '新規登録が可能なとき' do
      it 'タイトル, ジャンル, 対象ポジション, 解説, 画像, ビデオ, 参考動画URL,があるとき登録できる' do
        expect(@skill).to be_valid
      end
      it '画像が空でも登録できる' do
        @skill.image = nil
        expect(@skill).to be_valid
      end
      it 'ビデオが空でも登録できる' do
        @skill.video = nil
        expect(@skill).to be_valid
      end
      it '参考動画URLが空でも登録できる' do
        @skill.skill_url = ''
        expect(@skill).to be_valid
      end
    end

    context '新規登録が不可能なとき' do
      it 'タイトルが空のとき登録できない' do
        @skill.drill_name = ''
        @skill.valid?
        expect(@skill.errors.full_messages).to include "Drill name can't be blank"
      end
      it 'ジャンルが空のとき登録できない' do
        @skill.category_id = ''
        @skill.valid?
        expect(@skill.errors.full_messages).to include "Category can't be blank"
      end
      it '対象ポジションが空のとき登録できない' do
        @skill.genre_id = ''
        @skill.valid?
        expect(@skill.errors.full_messages).to include "Genre can't be blank"
      end
      it '解説が空のとき登録できない' do
        @skill.info = ''
        @skill.valid?
        expect(@skill.errors.full_messages).to include "Info can't be blank"
      end
      it '解説が1001文字以上のとき登録できない' do
        @skill.info = Faker::Lorem.characters(number: 1001)
        @skill.valid?
        expect(@skill.errors.full_messages).to include 'Info is too long (maximum is 1000 characters)'
      end
      it '画像投稿フォームに動画ファイルは選択しても投稿できない' do
        @skill.image = fixture_file_upload('public/videos/test_video.mp4')
        @skill.valid?
        expect(@skill.errors.full_messages).to include 'Image file should be one of image/jpeg, image/jpg, image/png, image/bmp, image/gif'
      end
      it '動画投稿フォームに画像ファイルは選択しても投稿できない' do
        @skill.video = fixture_file_upload('public/images/test_image.png')
        @skill.valid?
        expect(@skill.errors.full_messages).to include 'Video file should be one of video/mp4, video/mov, video/quicktime'
      end
      it '参考動画にURLではなく違う文字列を入力しても登録できない' do
        @skill.skill_url = 'testtest'
        @skill.valid?
        expect(@skill.errors.full_messages).to include 'Skill url enter the URL'
      end
    end
  end
end
