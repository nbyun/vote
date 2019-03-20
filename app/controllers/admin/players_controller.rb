class Admin::PlayersController < Admin::AdminBaseController
  before_action :set_player, only: [:edit, :update, :destroy]

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.invalid?
      render :new
      return
    end
    Player.transaction do
      begin
        @player.save!
        #save_or_update_image do
        #  raise ActiveRecord::Rollback
        #  return
        #end
        flash[:notice] = I18n.t('messages.create_success')
        redirect_to admin_players_path
      rescue => e
        #@player.player_picture = nil
        render :new
        logger.error e.message
        logger.error e.backtrace
        raise ActiveRecord::Rollback
      end

    end
  end

  def edit
  end

  def update
    @player.attributes = player_params
    if @player.invalid?
      #save_or_update_image
      render :edit
      return
    end
    Player.transaction do
      begin
        @player.save!
        #save_or_update_image do
        #  raise ActiveRecord::Rollback
        #  return
        #end
        flash[:notice] = I18n.t('messages.update_success')
        redirect_to admin_players_path
      rescue => e
        #@player.player_picture = nil
        render :edit
        logger.error e.message
        logger.error e.backtrace
        raise ActiveRecord::Rollback
      end
    end
  end

  def destroy
    respond_to do |format|
      if  @player.destroy
        flash[:notice] = I18n.t('messages.delete_success')
        format.html { redirect_to admin_palyers_url}
        format.json { head :no_content }
      else
        flash[:error] = I18n.t('messages.delete_failed')
        format.html { redirect_to admin_palyers_url}
      end
    end
  end

  private

  def set_player
    @player = Player.where(id: params[:id]).first
    if @player.blank?
      flash[:error] = I18n.t('messages.missing_data')
      redirect_to admin_players_path
      return
    end
  end

  def player_params
    params.fetch(:player, {}).permit(:name,:nickname,:description, :avatar)
  end

end
