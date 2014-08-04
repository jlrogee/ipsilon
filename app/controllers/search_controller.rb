class SearchController < ApplicationController

  def index
    case
      when params[:name] == "Category"
        @categories = Category.search(params[:search]).paginate(:page => params[:page])
        render :template => 'categories/index'

      when params[:name] == "Problem"
        @problems = Problem.search(params[:search]).paginate(:page => params[:page])
        render :template => 'problems/index'

      when params[:name] == "Departament"
        @departaments = Departament.search(params[:search]).paginate(:page => params[:page])
        render :template => 'departaments/index'

      when params[:name] == "Asset"
        @assets = Asset.search(params[:search]).paginate(:page => params[:page])
        render :template => 'assets/index'

      when params[:name] == "Registration"
        @search = User.search(params[:search]).paginate(:page => params[:page])

      when params[:name] == "KnowledgeBase"
        @search = KnowledgeBase.search(params[:search]).paginate(:page => params[:page])
        render :template => 'knowledge_bases/search'

      else
        render 'error'
    end
  end
end
