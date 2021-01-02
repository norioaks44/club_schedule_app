class MeetingTime < ActiveHash::Base
  self.data = [
    # { id: 1, name: '選択して下さい'},
    { id: 2, name: '休み'},
    { id: 3, name: '7:00'},
    { id: 4, name: '7:30'},
    { id: 5, name: '8:00'},
    { id: 6, name: '8:30'},
    { id: 7, name: '9:00'},
    { id: 8, name: '9:30'},
    { id: 9, name: '10:00'},
    { id: 10, name: '10:30'},
    { id: 11, name: '11:00'},
    { id: 12, name: '11:30'},
    { id: 13, name: '12:00'},
    { id: 14, name: '12:30'},
    { id: 15, name: '13:00'},
    { id: 16, name: '13:30'},
    { id: 17, name: '14:00'},
    { id: 18, name: '14:30'},
    { id: 19, name: '15:00'},
    { id: 20, name: '15:30'},
    { id: 21, name: '16:00'},
    { id: 22, name: '16:30'}
  ]
  include ActiveHash::Associations
  has_many :events
end