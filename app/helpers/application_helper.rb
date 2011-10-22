module ApplicationHelper
  def flash_helper
    f_names = [:warning, :error, :success, :notice]
    fl = ''
    
    for name in f_names
      if flash[name]
        fl = fl + "<div class=\"alert-message #{name}\"><p>#{flash[name]}</p></div>"
      end
      
      flash[name] = nil;
    end
    return raw(fl)
  end
end
