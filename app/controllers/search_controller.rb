class SearchController < ApplicationController
 
  layout "home_template"
  
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
      when "users"
          redirect_to "/search/users_search?q=#{params[:q]}"
          
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
 
       
       @code_snippets = CodeSnippet.search do 
             fulltext params[:q] do
                fields :title, :tags
                minimum_match 1
              end 
          end.results
  end
  
  def users_search
    @users= User.search do
      fulltext params[:q] do
        fields :name
        minimum_match 1
      end
    end.results
  end

  def advance_search
  #raise params.inspect
   @response= HTTParty.get("https://api.stackexchange.com/2.2/search/advanced?order=desc&sort=activity&q=#{params[:title].gsub!(/\s+/, '%20')}&accepted=True&site=stackoverflow")
   @result = @response.body
   #raise @result.inspect
     respond_to do |format|
        format.html # show.html.erb
        format.json {render :json => JSON(@result)   }
        format.js
     end
   end

end
