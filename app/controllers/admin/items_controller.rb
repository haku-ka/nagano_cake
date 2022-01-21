class Admin::ItemsController < ApplicationController

   def new
      @item = Item.new
      @genre = Genre.all
   end

   def index
      @items = Item.all
 
   end

   def create
      @item = Item.new(item_params)
      @genre = Genre.all
    if @item.save
    	flash[:notice] = "新しく商品を追加しました。"
    	redirect_to admin_items_path(@item.id)
    else
    	render 'new'
    end
   end


   def show
      @item = Item.find(params[:id])
   end

   def edit
      @item = Item.find(params[:id])
   end


	def update
		@item = Item.find(params[:id])
      @genre = @item.genre
		if @item.update(item_params)
			flash[:notice] = "商品情報を更新しました。"
			redirect_to admin_item_path(@item)
		else
			render 'edit'
		end
	end


  private
  def item_params
    params.require(:item).permit(:name, :image_id, :introduction, :price, :genre_id, :is_active)
  end


end
