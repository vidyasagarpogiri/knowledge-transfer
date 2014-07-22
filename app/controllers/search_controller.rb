class SearchController < ApplicationController
 
  layout "home_template", only: :global_search_engine
  
  def search_engine
    @result=
    case params[:search_type]
      when "all"
          redirect_to "/search/global_search_engine?q=#{params[:q]}"
      when "question"
          Question.search do
             fulltext params[:q] do
              fields :title, :tags
              minimum_match 1
          end
          end.results
      when "article"
          Article.search do
             fulltext params[:q] do
              fields :title, :tags
              minimum_match 1
          end
          end.results  
      when "blog"
          Blog.search do
             fulltext params[:q] do
              fields :title, :tags
              minimum_match 1
          end
          end.results  
      when "code_snippet"
          CodeSnippet.search do
             fulltext params[:q] do
              fields :title, :tags
              minimum_match 1
          end
          end.results
    end
  end


  def global_search_engine
   
       @articles= Article.search  do 
             fulltext params[:q] do
                fields :title, :tags
                minimum_match 1
              end 
          end.results
          
         @blogs= Blog.search  do 
             fulltext params[:q] do
                fields :title, :tags
                minimum_match 1
              end 
          end.results
       
       
       @questions= Question.search  do 
             fulltext params[:q] do
                fields :title, :tags
                minimum_match 1
              end 
          end.results
 
       
       @code_snippets= CodeSnippet.search do 
             fulltext params[:q] do
                fields :title, :tags
                minimum_match 1
              end 
          end.results
  end


end
