class Category
  include Mongoid::Document
  
  field :name
  field :icon
  
  has_many :boxes
  has_one :template
  
  validates_presence_of :name
end
