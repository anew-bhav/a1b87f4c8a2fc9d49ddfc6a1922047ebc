class HomeController < ApplicationController

  def index
    if params[:query].present?
      response = Github.respositories(params[:query])
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
