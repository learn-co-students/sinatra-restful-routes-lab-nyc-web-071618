class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  #display all recipes
  get '/recipes' do
    erb :index
  end

  #get recipe form
  get '/recipes/new' do
    erb :'recipes/new'
  end

  #post recipes
  post '/recipes' do
    recipe = Recipe.create(params)
    redirect "/recipes/#{recipe.id}"
  end

  #gets recipe & displays it to show page
  get '/recipes/:id' do
    id = params[:id].to_i
    @recipe = Recipe.find_by_id(id)
    erb :'recipes/show'
  end

  get '/recipes/:id/edit' do
    id = params[:id]
    @recipe = Recipe.find_by(id: id)
    erb :'recipes/edit'
  end

  patch '/recipes/:id' do
    id = params[:id]
    recipe = Recipe.find_by(id: id)
    Recipe.update(recipe)
    redirect "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id/delete' do
    id = params[:id].to_i
    Recipe.destroy(id)
    # redirect '/recipes/new'
    redirect "/recipes/#{id}"
  end
end
