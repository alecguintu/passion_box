class Collection
  include Mongoid::Document

  field :name, :type => String
  field :category, :type => String
    
  attr_accessible :name, 
end
