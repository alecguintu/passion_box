class TradeController < ApplicationController

  def index
    @my_items = UserItem.find(:all, :conditions => {:box_id.in => current_user.boxes.collect{|b| b.id } })
  end

end
