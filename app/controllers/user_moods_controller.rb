class UserMoodsController < ApplicationController
  before_action :set_user_mood, only: [:show, :edit, :update, :destroy]

  # GET /user_moods
  # GET /user_moods.json
  def index
    @user_moods = UserMood.order("created_at desc").paginate(page: params[:page], per_page: 10)
  end

  # GET /user_moods/1
  # GET /user_moods/1.json
  def show
  end

  # GET /user_moods/new
  def new
    @user_mood = UserMood.new
  end

  # GET /user_moods/1/edit
  def edit
  end

  # POST /user_moods
  # POST /user_moods.json
  def create
    @user_mood = UserMood.new(user_mood_params)
    @user_mood.user_id = current_user.id

    respond_to do |format|
      if @user_mood.save
        format.html { redirect_to @user_mood, notice: 'Thanks for sharing your feeling!' }
        format.json { render :show, status: :created, location: @user_mood }
      else
        render moods_path
        #format.html { render :new }
        #format.json { render json: @user_mood.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def add_mood
    @user = User.find(params[:user_id])
    @mood = Mood.find(params[:mood_id])
    @user_mood = UserMood.new(user_id: @user.id, mood_id: @mood.id)

    #respond_to do |format|
      if @user_mood.save
        #format.html { redirect_to @moods, notice: 'Thanks for sharing your feeling!' }
        redirect_to root_path, notice: "Thanks for sharing your feeling!"
        #format.json { render :moods, status: :created, location: @user_mood }
      else
        render moods_path
        #format.html { render :new }
        #format.json { render json: @user_mood.errors, status: :unprocessable_entity }
      end
    #end
  end


  # PATCH/PUT /user_moods/1
  # PATCH/PUT /user_moods/1.json
  def update
    respond_to do |format|
      if @user_mood.update(user_mood_params)
        format.html { redirect_to @user_mood, notice: 'User mood was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_mood }
      else
        format.html { render :edit }
        format.json { render json: @user_mood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_moods/1
  # DELETE /user_moods/1.json
  def destroy
    @user_mood.destroy
    respond_to do |format|
      format.html { redirect_to user_moods_url, notice: 'User mood was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_mood
      @user_mood = UserMood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_mood_params
      params.require(:user_mood).permit(:user_id, :mood_id)
    end
end
