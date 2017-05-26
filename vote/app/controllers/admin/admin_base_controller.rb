class Admin::AdminBaseController < ApplicationController
  layout 'application_admin'
  prepend_before_action :set_locale
  before_action :authenticate_admin!

  def set_locale
    I18n.locale = 'zh-CN'
  end
end
