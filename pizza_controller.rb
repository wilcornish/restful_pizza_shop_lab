require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order.rb')
also_reload('./models/*')

#index
get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

#new
get '/pizza-orders/new' do
  erb(:new)
end

#edit

get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

get '/about-us' do
  erb(:about_us)
end

get '/contact' do
  erb(:contact)
end

#delete
post '/pizza-orders/:id/delete' do
  order_to_delete = PizzaOrder.find(params[:id].to_i)
  order_to_delete.delete()

  redirect '/pizza-orders'
end

#show
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id].to_i)
  erb(:show)
end

#create
post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

#UPDATE
post '/pizza-orders/:id' do
  @order = PizzaOrder.new(params)
  @order.update()
  redirect '/pizza-orders'
end
