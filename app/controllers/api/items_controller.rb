class Api::ItemsController < ApiController
   before_action :authenticated?

   def index
     itmes = Item.all
     render json: items, each_serializer: ItemSerializer
   end

   def create
     list = List.find(params[:list_id])
     item = Item.new(item_params)
     item.list_id = list.id
     if item.save
       render json: item
     else
       render json: { errors: item.errors.full_messages }, status: :unprocessable_entry
     end
   end

   def destroy
     begin
       item = Item.find(params[:id])
       item.destroy
       render json: {}, status: :no_content
     rescue ActiveRecord::RecordNotFound
       render :json => {}, :status => :not_found
     end
   end

   def update
     item = Item.find(params[:id])
     if item.update_attributes(item_params)
       render json: item
     else
       render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
     end
   end

   private

   def item_params
     params.require(:item).permit(:title, :body, :list_id)
   end

 end
