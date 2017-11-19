class StaticController < ApplicationController
  def homepage
    @posts = AuditLog.where(status: 'pending')
  end
end
