class Item
  include Mongoid::Document
  
  field :title
  field :description
  field :tags, :type => Array
  
  def tags=(_tags)
    write_attribute(:tags, _tags.split(',').collect{|t| t.strip})
  end
  
  def tags_to_s
    self.tags.join(', ') unless self.tags.blank?
  end
end
