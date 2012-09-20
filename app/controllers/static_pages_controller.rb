class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def findings
  	@studies = Study.paginate(page: params[:page])
  end
end
