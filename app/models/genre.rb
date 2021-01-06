class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ルール' },
    { id: 2, name: 'タックル' },
    { id: 3, name: 'パス' },
    { id: 4, name: 'キック' },
    { id: 5, name: 'ラック' },
    { id: 6, name: 'セットプレー' },
    { id: 7, name: '戦術' },
    { id: 8, name: 'アタック' },
    { id: 9, name: 'ディフェンス' },
    { id: 10, name: '小技' }
  ]
  include ActiveHash::Associations
  has_many :skills
end
