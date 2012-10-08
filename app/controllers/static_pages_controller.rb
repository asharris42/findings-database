class StaticPagesController < ApplicationController
  def home
  	@recent_studies = Study.recent
  end

  def help
  end

  def findings
  	@studies = Study.by_date.paginate(page: params[:page])
  end
end
