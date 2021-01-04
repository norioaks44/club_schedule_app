class Position < ActiveHash::Base
  self.data = [
    { id: 1, name: 'PR'},
    { id: 2, name: 'HO'},
    { id: 3, name: 'LO'},
    { id: 4, name: 'FL'},
    { id: 5, name: 'No.8'},
    { id: 6, name: 'SH'},
    { id: 7, name: 'SO'},
    { id: 8, name: 'CTB'},
    { id: 9, name: 'WTB'},
    { id: 10, name: 'FB'},
    { id: 11, name: 'Staff'}
  ]
  include ActiveHash::Associations
  has_many :users
end