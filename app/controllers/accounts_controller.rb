class AccountsController < ApplicationController
  before_action :authorize_admin!, except: [:index, :show]
  before_action :require_signin!
  before_action :set_account, only: [:show, :update, :destroy]

  def index
    @accounts = Account.all

    respond_to do |format|
      format.html
      format.csv { send_data @accounts.to_csv }
    end
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.user = current_user
    authorize @account
 
    if @account.save
      flash[:notice] = 'Account created'
      redirect_to @account
    else
      flash[:alert] = 'Account not created'
      render :new
    end    
  end

  def update
    if @account.update_attributes(account_params)
      flash[:notice] = 'Account updated'
      redirect_to @account
    else
      flash[:alert] = 'Account not updated'
      redirect_to @account
    end
  end
  
  def destroy
    @account.destroy
    flash[:notice] = 'Account deleted'
    redirect_to @account
  end

  private
    
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:name, :website, :notes,

        billing_address_attributes:
          [:id, :street_1, :street_2, :city, :state, :postal_code, :country, :type],

        shipping_address_attributes:
          [:id, :street_1, :street_2, :city, :state, :postal_code, :country, :type],

        emails_attributes:
          [:id, :address],

        phone_attributes:
          [:id, :office, :mobile, :fax, :home, :toll],

        social_media_attributes:
          [:id, :google_plus, :github, :twitter, :skype, :coderwall, :linkedin,
            :facebook])
    end
end
