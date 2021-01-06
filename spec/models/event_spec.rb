require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end

  describe '活動日新規登録' do
    context '新規登録が可能なとき' do
      it 'title_id, strat_time, meeting_time_id, infoがあるとき登録できる' do
        expect(@event).to be_valid
      end
      it 'infoが空でも登録できる' do
        @event.info = ''
        expect(@event).to be_valid
      end
    end

    context '新登録が不可能なとき' do
      it 'タイトルが空だと登録できない' do
        @event.title_id = nil
        @event.valid?
        expect(@event.errors.full_messages).to include "Title can't be blank"
      end
      it '同じ日付に重複して登録できない' do
        @event.save
        another_event = FactoryBot.build(:event)
        another_event.start_time = @event.start_time
        another_event.valid?
        expect(another_event.errors.full_messages).to include 'Start time has already been taken'
      end
      it '日付が空だと登録できない' do
        @event.start_time = nil
        @event.valid?
        expect(@event.errors.full_messages).to include "Start time can't be blank"
      end
      it '集合時間が空だと登録できない' do
        @event.meeting_time_id = nil
        @event.valid?
        expect(@event.errors.full_messages).to include "Meeting time can't be blank"
      end
      it '詳細情報が1001字以上だと登録できない' do
        @event.info = Faker::Lorem.characters(number: 1001)
        @event.valid?
        expect(@event.errors.full_messages).to include 'Info is too long (maximum is 1000 characters)'
      end
    end
  end
end
