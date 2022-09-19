# frozen_string_literal: true

require 'sinatra'
require 'csv'

# class HelloWorldApp
class HelloWorldApp < Sinatra::Base
  set :method_override, true
  PATH = './data.csv'
  get '/' do
    erb :main_page
  end
  get '/products' do
    csv = CSV.read(PATH)
    @data = csv.map do |entry|
      "#{entry[0]}, #{entry[1]}, #{entry[2]}, #{entry[3]}, #{entry[4]}"
    end
    erb :index
  end
  get('/products/create') do
    erb :create_product
  end

  post '/products' do
    id = CSV.read(PATH).count
    product = params[:product]
    CSV.open(PATH, 'a+') do |row|
      row << [id, *product.values]
    end
    redirect '/products'
  end

  patch '/products/:id' do
    id = params[:id]
    table = CSV.table(PATH)
    table.delete_if do |row|
      row[0] == id.to_i
    end
    File.open(PATH, 'w', headers: false) do |f|
      f.write(table.to_csv)
    end
    CSV.open(PATH, 'a+') do |row|
      row << [id, *params[:product].values]
    end
    redirect '/products'
  end

  delete '/products/:id' do
    id = params[:id]
    table = CSV.table(PATH)
    table.delete_if do |row|
      row[0] == id.to_i
    end
    File.open(PATH, 'w') do |f|
      f.write(table.to_csv)
    end
    redirect '/products'
  end
end
