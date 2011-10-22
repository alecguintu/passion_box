class Template
  include Mongoid::Document
  
  field :global_fields, :type => Array
  field :user_fields, :type => Array
  
  belongs_to :user
  belongs_to :category
  
  def global_fields=(_global_fields)
    write_attribute(:global_fields, _global_fields.split(',').collect{|t| t.strip})
  end
  
  def user_fields=(_user_fields)
    write_attribute(:user_fields, _user_fields.split(',').collect{|t| t.strip})
  end
end
