class Box
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, :type => String
  field :category, :type => String
  
  belongs_to  :user
  has_many    :user_items
  
  attr_accessible :name, :category
end