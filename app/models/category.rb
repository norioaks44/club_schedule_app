class Category < ActiveHash::Base
  self.data = [
    # { id: 1, name: '選択して下さい'},
    { id: 2, name: 'FW'},
    { id: 3, name: 'BK'},
    { id: 4, name: 'FW,BK両方'}
  ]

  include ActiveHash::Associations
  has_many :skills
end

