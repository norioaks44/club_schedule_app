class Title < ActiveHash::Base
  self.data = [
    { id: 1, name: '放課後練習' },
    { id: 2, name: '半日練習' },
    { id: 3, name: '練習試合' },
    { id: 4, name: '公式戦' },
    { id: 5, name: 'その他' },
    { id: 6, name: 'OFF' }
  ]
  include ActiveHash::Associations
  has_many :events
end
