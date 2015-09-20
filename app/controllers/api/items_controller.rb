class Api::ItemsController < ApiController
  #  before_action :authenticated?

   def index
     itmes = Item.all
     render json: item, each_serializer: ItemSerializer
   end

   def create
     item = Item.new(item_params)
     if item.save
       render json: item
     else
       render json: { errors: item.errors.full_messages }, status: :unprocessable_entry
     end
   end

   private

   def item_params
     params.require(:item).permit(:title, :body)
   end

 end
