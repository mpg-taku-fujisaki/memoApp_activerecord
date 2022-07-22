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

get '/show' do
    @memos = Memo.all
    erb :show
end

