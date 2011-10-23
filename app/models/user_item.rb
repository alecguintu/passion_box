class UserItem
  include Mongoid::Document
  include Mongoid::Paperclip
  
  field :title
  field :description
  field :tags, :type => Array
  field :image
  # field :image_file_name
  # field :image_content_type
  # field :image_file_size, type: Integer
  # field :image_updated_at, type: DateTime
  
  validates_presence_of :title
  
  belongs_to :box
  
  # has_mongoid_attached_file :image

  MY_FIELDS = ['_id', 'box_id', 'category_id', 'title', 'description', 'tags', 'image']

  # after_save :save_to_global_item
  
  def tags=(_tags)
    write_attribute(:tags, _tags.split(',').collect{|t| t.strip})
  end
  
  def tags_to_s
    self.tags.join(', ') unless self.tags.blank?
  end
  # def image_url(*args)
  #   image.url(*args)
  # end
  # 
  # def image_name
  #   image_file_name
  # end
  # 
  # def image_content_type
  #   image_content_type
  # end
  # 
  # def image_file_size
  #   image_file_size
  # end

  def extra_fields
    self.attributes.keys - MY_FIELDS
  end
  
  private
  
  # def save_to_global_item
  #   @global_item = Item.where(:title => self.title).first
  #   unless @global_item
  #     Item.create(:title => self.title, :description => self.description, )
  #   end
  # end
end
