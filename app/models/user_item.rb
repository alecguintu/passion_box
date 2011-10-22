class UserItem
  include Mongoid::Document
  
  field :title
  field :description
  field :tags, :type => Array
  field :image
  
  validates_presence_of :title
  
  belongs_to :box
  
  # after_save :save_to_global_item
  
  def tags=(_tags)
    write_attribute(:tags, _tags.split(',').collect{|t| t.strip})
  end
  
  def tags_to_s
    self.tags.join(', ') unless self.tags.blank?
  end
  
  private
  
  # def save_to_global_item
  #   @global_item = Item.where(:title => self.title).first
  #   unless @global_item
  #     Item.create(:title => self.title, :description => self.description, )
  #   end
  # end
end
