class ApplicationController < ActionController::Base

  def act1
    @today = Date.today.strftime('%Y年%m月%d日')
  end
  
end
