class Grade < ActiveHash::Base
  self.data = [
    { id: 1, name: '外部' },
    { id: 2, name: '20~25期' },
    { id: 3, name: '26~30期' },
    { id: 4, name: '30~35期' },
    { id: 5, name: '36~39期' },
    { id: 6, name: '40' },
    { id: 7, name: '41' },
    { id: 8, name: '42' },
    { id: 9, name: '43' }
  ]
  include ActiveHash::Associations
  has_many :users
end
