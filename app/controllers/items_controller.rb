class ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


  def index
    if params[:user_id]
      user = User.find_by(id: params[:id])
      items = user.items
    else
    items = Item.all
    end
    render json: items, include: :user

  end

  def render_not_found_response(exception)
    render json: { error: "#{exception.model} not found" }, status: :not_found
  end

end
