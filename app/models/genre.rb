class Genre < ActiveHash::Base
self.data = [
  # { id: 1, name: '選択して下さい'},
  { id: 2, name: 'ルール'},
  { id: 3, name: 'タックル'},
  { id: 4, name: 'パス'},
  { id: 5, name: 'キック'},
  { id: 6, name: 'ラック'},
  { id: 7, name: 'セットプレー'},
  { id: 8, name: '戦術'},
  { id: 9, name: 'アタック'},
  { id: 10, name: 'ディフェンス'},
  { id: 11, name: '小技'}
]
include ActiveHash::Associations
has_many :skills

end