class Admin::CustomersController < ApplicationController
  
  def index
    @customers = Customer.all
  end
  
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
 
    if @customer.update(customer_params)
			flash[:notice] = "更新しました。"
			redirect_to admin_custome_path(@customer)
		else
			render 'edit'
    end
  end
  
    private
  def customer_params
    params.require(:customer).permit(:id, :last_name, :first_name, :last_name_kana, :email, :telephone_number, :first_name_kana, :genre_id, :is_active)
  end

  
end
