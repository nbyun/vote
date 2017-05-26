class Admin::SessionsController < Devise::SessionsController
  layout false
  before_action :set_local

  def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path
  end

  def set_local
    I18n.locale = 'zh-CN'
  end

end
