class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    render :json => @users, each_serializer: UserSerializer
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if (params[:id].to_i>0)
      @user = User.find params[:id]
      render :json => @user, each_serializer: UserSerializer
    elsif User.respond_to? params[:id].to_sym
      @user = User.send(params[:id].to_sym)
      render :json => @user, each_serializer: UserSerializer
    else
      render json: nil, status: :unprocessable_entity
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    ActiveRecord::Base.transaction do
      logger.info "params inspect #{params.inspect}"
      @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          params[:addresses].each do |address|
            address_map = {name: address.keys.first}
            address_map = address_map.merge(address.values.first)
            @user.addresses.build(address_map).save!
          end
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render :json => @user, each_serializer: UserSerializer }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  rescue ActiveRecord::RecordInvalid
   render json: @user.errors, status: :unprocessable_entity
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    ActiveRecord::Base.transaction do
      respond_to do |format|
        if @user.update(user_params)
          for address in params[:addresses]
            Address.find_or_initialize_by(
              user_id: @user.id,
              name: address.keys.first).
              update_attributes!(address.values.first)
          end
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :json => @user, each_serializer: UserSerializer }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  rescue ActiveRecord::RecordInvalid
     render json: @user.errors, status: :unprocessable_entity
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :middle_name, :last_name, :age)
    end
    def address_params
        params.require(:addresses).permit(:line1, :line2, :city, :state,:country,:zip)
    end
end
