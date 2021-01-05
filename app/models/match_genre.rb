class MatchGenre < ActiveHash::Base
  self.data = [
    { id: 1, name: '練習試合'},
    { id: 2, name: '新人戦'},
    { id: 3, name: '関東予選'},
    { id: 4, name: '7s'},
    { id: 5, name: '菅平合宿'},
    { id: 6, name: '花園予選'}
  ]
  include ActiveHash::Associations
  has_many :reviews
  
  end