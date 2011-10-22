class Box
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, :type => String
  field :category, :type => String
  
  belongs_to  :category
  belongs_to  :user
  has_many    :user_items
  
  validates_presence_of :name
end
