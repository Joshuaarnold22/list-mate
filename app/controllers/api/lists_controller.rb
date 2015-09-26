class Api::ListsController < ApiController
  before_action :authenticated?

  def index
    lists = List.all
    render json: lists, each_serializer: ListSerializer
  end

  def create
    user = User.find(params[:user_id])
    list = user.lists.build(list_params)
    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entry
    end
  end

  def destroy
    begin
      user = User.find(params[:user_id])
      list = List.find(params[:id])
      list.destroy
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end

  def update
    user = User.find(params[:user_id])
    list = List.find(params[:id])
    if list.update(list_params)
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :permissions)
  end

  def authenticated?
    authenticate_or_request_with_http_basic do |name, password|
      puts "hello there!!!"
      user_search = User.where( name: name, password: password)
      if user_search.present?
        user = user_search.first

        if user.id != params[:user_id]
          false
        end

        if params[:id]
          list = List.find(params[:id])
          puts "#{list.user.name} #{user.name}"
          puts "#{list.user == user}"
          list.user == user
        else
          true
        end
      else
        false
      end
    end
  end

end
