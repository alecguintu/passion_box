class UserItem
  include Mongoid::Document
  
  field :title
  field :description
  
  validates_presence_of :title
  
  belongs_to :box
  
  after_save :save_to_global_item
  
  private
  
  def save_to_global_item
    @global_item = Item.where(:title => self.title).first
    unless @global_item
      Item.create(:title => self.title, :description => self.description)
    end
  end
end
