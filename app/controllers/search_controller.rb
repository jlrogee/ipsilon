class SearchController < ApplicationController

  def index
    case
      when params[:name] == "Category"
        @search_res = Category.search do
          fulltext params[:search]
          order_by :updated_at
          paginate :page => params[:page]
        end
        @search = @search_res.results

      when params[:name] == "Problem"
        @search_res = Problem.search do
          fulltext params[:search]
          order_by :updated_at
          paginate :page => params[:page]
        end
        @search = @search_res.results

      when params[:name] == "Departament"
        @search_res = Departament.search do
          fulltext params[:search]
          order_by :updated_at
          paginate :page => params[:page]
        end
        @search = @search_res.results

      when params[:name] == "Asset"
        @search_res = Asset.search do
          fulltext params[:search]
          order_by :updated_at
          paginate :page => params[:page]
        end
        @search = @search_res.results

      when params[:name] == "Registration"
        @search_res = Registration.search do
          fulltext params[:search]
          order_by :updated_at
          paginate :page => params[:page]
        end
        @search = @search_res.results

      when params[:name] == "KnowledgeBase"
        @search_res = KnowledgeBase.search do
          fulltext params[:search]
          order_by :updated_at
          paginate :page => params[:page]
        end
        @search = @search_res.results

      else
        render 'error'
    end
  end
end
