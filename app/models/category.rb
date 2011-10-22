class Category
  include Mongoid::Document
  
  field :name
  
  has_many :boxes
  
  validates_presence_of :name
end
