require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

before do
  if Count.count == 0
    Count.create(number: 0)
  end
end

get '/' do
  @number = Count.first.number
  erb :index
end

post '/plus' do
  Count.first.number = Count.first.number + 1
end  

post '/minus' do
  Count.first.number = Count.first.number - 1
end

post '/clear' do
  Count.first.number = 0
end

post '/times' do
  Count.first.number = Count.first.number * 2
end

post '/divided' do
  Count.first.number = Count.first.number / 2
end

