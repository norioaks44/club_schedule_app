class Position < ActiveHash::Base
  self.data = [
    # { id: 1, name: '選択して下さい'},
    { id: 2, name: 'PR'},
    { id: 3, name: 'HO'},
    { id: 4, name: 'LO'},
    { id: 5, name: 'FL'},
    { id: 6, name: 'No.8'},
    { id: 7, name: 'SH'},
    { id: 8, name: 'SO'},
    { id: 9, name: 'CTB'},
    { id: 10, name: 'WTB'},
    { id: 11, name: 'FB'},
    { id: 12, name: 'Staff'}
  ]
  include ActiveHash::Associations
  has_many :users
end