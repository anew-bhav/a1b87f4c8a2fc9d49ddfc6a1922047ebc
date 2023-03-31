class HomeController < ApplicationController
#
  def index
    @page = params[:page] || 1
    if params[:query].present?
      response = Github.respositories(params[:query], params[:per_page], @page)
      if response[:success]
        @result = response[:data]['items']
      else
        flash.now[:notice] = "something went wrong, try again"
      end
    else
      flash.now[:notice] = "cannot be empty"
    end
  end
end

