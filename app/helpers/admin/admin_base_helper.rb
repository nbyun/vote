module Admin::AdminBaseHelper

  def collapse_menu_helper(container)
    controller = params[:controller].split('/').last
    if (container[controller.to_s.to_sym].present? && container[controller.to_s.to_sym].include?(params[:action].to_s.to_sym)) || (container.has_key?(controller.to_s.to_sym) && container[controller.to_s.to_sym].blank?)
      'collapse in'
    else
      ''
    end
  end

  #【引数】active_menu({users: [:new, :create]})
  #【返回】
  #【注意】
  #【著作】
  def active_menu_helper(container)
    controller = params[:controller].split('/').last
    if (container[controller.to_s.to_sym].present? && container[controller.to_s.to_sym].include?(params[:action].to_s.to_sym)) || (container.has_key?(controller.to_s.to_sym) && container[controller.to_s.to_sym].blank?)
      'active'
    else
      ''
    end
  end

  #【引数】
  #【返回】
  #【注意】
  #【著作】2016-08-19 by nby
  def switch_key(key)
    case key.to_s
      when 'alert'
        'warning'
      when 'notice'
        'success'
      else
        key
    end
  end

  #【引数】params[:controller] params[:action]
  #【返回】title
  #【注意】
  #【著作】
  def get_admin_title
    controller = params[:controller].to_s.sub('admin/','')
    if title_hash_for_admin[controller.to_sym].present? && title_hash_for_admin[controller.to_sym][params[:action].to_s.to_sym].present?
      title_hash_for_admin[controller.to_sym][params[:action].to_s.to_sym]
    else
      'b王争霸赛管理后台'
    end
  end

  #给页面title赋值
  #【引数】
  #【返回】
  #【注意】
  #【著作】
  def title_hash_for_admin
    { home: {index: '首页'} }
  end
end
