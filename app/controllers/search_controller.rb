class SearchController < ApplicationController

  def index
    case
      when params[:name] == "Category"
        @categories = Category.search(params[:search])
        @categories = @categories.paginate(:page => params[:page])
        render :template => 'categories/index'
      when params[:name] == "Registration"
        @search = User.search(params[:search])
        @search = @search.paginate(:page => params[:page])
      else
        render 'error'
    end

  end
end
