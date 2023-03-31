class HomeController < ApplicationController
#
  def index
    @page = params[:page] || 1
    @per_page = params[:per_page] || 40
    if params[:query].present?
      response = Github.respositories(params[:query], @per_page, @page)
      if response[:success]
        @result = response[:data]['items']
      else
        flash.now[:notice] = response[:error]["message"]
      end
    else
      flash.now[:notice] = "Type search keyword in the field and press ⏎ Enter/Return"
    end
  end
end

