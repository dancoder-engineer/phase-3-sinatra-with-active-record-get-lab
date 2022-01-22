class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  # add routes
  get '/bakeries' do
    bak = Bakery.all
    bak.to_json
  end

  get '/bakeries/:id' do
    bak = Bakery.find(params[:id])
    bak.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    goodGoods = BakedGood.order("price DESC")
    goodGoods.to_json
  end

  get '/baked_goods/most_expensive' do
    goodGoods = BakedGood.order("price DESC")
    goodGoods.first.to_json
  end

end
