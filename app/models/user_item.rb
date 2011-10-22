class UserItem
  include Mongoid::Document
  
  field :title
  field :description
  field :tags, :type => Array
  
  validates_presence_of :title
  
  belongs_to :user
  
  after_save :save_to_global_item
  
  def tags=(_tags)
    write_attribute(:tags, _tags.split(',').collect{|t| t.strip})
  end
  
  private
  
  def save_to_global_item
    @global_item = Item.where(:title => self.title).first
    unless @global_item
      Item.create(:title => self.title, :description => self.description)
    end
  end
end
