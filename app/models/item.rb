class Item
  include Mongoid::Document
  include Mongoid::Paperclip
  
  field :title
  field :description
  field :tags, :type => Array
  # field :image_file_name
  # field :image_content_type
  # field :image_file_size, type: Integer
  # field :image_updated_at, type: DateTime
  
  # has_mongoid_attached_file :image
  
  def tags=(_tags)
    write_attribute(:tags, _tags.split(',').collect{|t| t.strip})
  end
  
  def tags_to_s
    self.tags.join(', ') unless self.tags.blank?
  end
  
  # sdef image_url(*args)
  # s  image.url(*args)
  # send
  # s
  # sdef image_name
  # s  image_file_name
  # send
  # s
  # sdef image_content_type
  # s  image_content_type
  # send
  # s
  # sdef image_file_size
  # s  image_file_size
  # send
  
end
