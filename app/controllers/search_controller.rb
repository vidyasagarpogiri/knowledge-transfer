class SearchController < ApplicationController

  def search_engine
    @result=
    case params[:search_type]
      when "question"
          Question.search do
             keywords params[:q]
          end.results
      when "article"
          Article.search do
             keywords params[:q]
          end.results  
      when "blog"
          Blog.search do
             keywords params[:q]
          end.results  
      when "code_snippet"
          CodeSnippet.search do
             keywords params[:q]
          end.results
    end
  end

end
