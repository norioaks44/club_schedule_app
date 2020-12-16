class Grade < ActiveHash::Base
self.data = [
  { id: 1, name: '--'},
  { id: 2, name: '44'},
  { id: 3, name: '43'},
  { id: 4, name: '42'},
  { id: 5, name: '41'},
  { id: 6, name: '40'},
  { id: 7, name: '39'},
  { id: 8, name: '38'},
  { id: 9, name: '37'},
  { id: 10, name: '36'},
  { id: 11, name: '35'},
  { id: 12, name: '34'},
  { id: 13, name: '33'},
  { id: 14, name: '32'},
  { id: 15, name: '31'},
  { id: 16, name: '30'},
  { id: 17, name: '29'},
  { id: 18, name: '28'},
  { id: 19, name: '27'},
  { id: 20, name: '26'},
  { id: 21, name: '25'},
  { id: 22, name: '24'},
  { id: 23, name: '23'},
  { id: 24, name: '22'},
  { id: 25, name: '21'},
  { id: 26, name: '20'}
]
include ActiveHash::Associations
has_many :users
end