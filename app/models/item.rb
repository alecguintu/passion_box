class Item
  include Mongoid::Document
  # include Mongoid::Paperclip
  
  field :title
  field :description
  field :tags, :type => Array
  MY_FIELDS = ['_id', 'category_id', 'title', 'description', 'tags', 'image']
  
  def tags=(_tags)
    write_attribute(:tags, _tags.split(',').collect{|t| t.strip})
  end
  
  def tags_to_s
    self.tags.join(', ') unless self.tags.blank?
  end
  
  def extra_fields
    self.attributes.keys - MY_FIELDS
  end
end
