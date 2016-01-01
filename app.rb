require 'sinatra'
require 'json'
require 'pry'

comments = [
  {id: 1, author: "Pete Hunt", text: "This is one comment"},
  {id: 2, author: "Jordan Walke", text: "This is *another* comment"}
]
total = 2

get '/' do
  erb :index
end

get '/api/comments' do
  content_type :json
  comments.to_json
end

post '/api/comment' do
  new_comment = {id: total + 1, author: params["author"], text: params["text"]}
  total += 1
  comments << new_comment
  content_type :json
  comments.to_json
end
