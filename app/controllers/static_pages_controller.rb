class StaticPagesController < ApplicationController
  before_filter :signed_in_user, only: [:admin_panel]

  def home
  	@recent_studies = Study.recent
  end

  def help
  end

  def findings
  	@studies = Study.by_date.paginate(page: params[:page])
  end

  def admin_panel

  end
end
