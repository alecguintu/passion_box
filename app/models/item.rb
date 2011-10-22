class Item
  include Mongoid::Document
  
  field :title
  field :description
  field :tags, :type => Array
  
  def tags=(_tags)
    write_attribute(:tags, _tags.split(',').collect{|t| t.strip!})
  end
end
