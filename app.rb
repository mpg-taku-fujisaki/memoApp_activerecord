require 'bundler'
Bundler.require


ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: './db/memos.db'
)

class Memo < ActiveRecord::Base
end

get '/' do
  "Number of Memos: #{Memo.count}"
end

get '/top' do
  @memos = Memo.all
  erb :top
end

get '/show/:id' do
  @memo = Memo.find(params[:id])
  
  erb :show
end

get '/new' do 
  erb :new
end

post '/new' do
  memo = Memo.new
  n_id = (Memo.count.to_i+1).to_s
  memo.id = n_id
  memo.title = params[:title]
  memo.content = params[:content]
  memo.save

	redirect '/top'
	erb :index
end

get '/edit/:id' do 
  @memo = Memo.find(params[:id])

  erb :edit
end

patch 'edit/:id' do
	@memo = Memo.find_by_id(params[:id])
	@memo.title = params[:title]
  @memo.content = params[:content]
	@memo.save
	redirect to "/top"
end

