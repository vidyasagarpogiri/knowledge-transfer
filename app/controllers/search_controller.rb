class SearchController < ApplicationController

  def search_engine
    @result=
    case params[:search_type]
      when "question"
          Question.search do
             fulltext params[:q] do
              fields :title
              minimum_match 1
            end
          end.results
      when "article"
          Article.search do
             fulltext params[:q] do
              fields :title
              minimum_match 1
            end
          end.results  
      when "blog"
          Blog.search do
             fulltext params[:q] do
              fields :title
              minimum_match 1
            end
          end.results  
      when "code_snippet"
          CodeSnippet.search do
             fulltext params[:q] do
              fields :title
              minimum_match 1
            end
          end.results
    end
  end

end
