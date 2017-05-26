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
      if params[:player][:player_picture].present?
        picture = PlayerPicture.new
        picture.image = params[:player][:player_picture]
        unless picture.valid?
          @player.errors.add(:player_picture, picture.errors.full_messages[1])
        end
      end
      render :new
      return
    end
    Player.transaction do
      begin
        @player.save!
        save_or_update_image do
          raise ActiveRecord::Rollback
          return
        end
        flash[:notice] = I18n.t('messages.create_success')
        redirect_to admin_players_path
      rescue => e
        @player.player_picture = nil
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
      save_or_update_image
      render :edit
      return
    end
    Maker.transaction do
      begin
        @player.save!
        save_or_update_image do
          raise ActiveRecord::Rollback
          return
        end
        flash[:notice] = I18n.t('messages.update_success')
        redirect_to admin_players_path
      rescue => e
        @player.player_picture = nil
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
    @player = Player.where(id: params[:id]).includes(:player_picture).first
    if @player.blank?
      flash[:error] = I18n.t('messages.missing_data')
      redirect_to admin_players_path
      return
    end
  end

  def player_params
    params.fetch(:player, {}).permit(:name,:nickname,:description)
  end

  def save_or_update_image
    if params[:player][:player_picture].present?
      maker_picture = @player.player_picture
      maker_picture = @player.build_player_picture if maker_picture.blank?
      maker_picture.image = params[:player][:player_picture]
      if maker_picture.valid?
        maker_picture.save!
      else
        @player.player_picture = nil
        @player.errors.add(:player_picture, maker_picture.errors.full_messages[1])
        yield if block_given?
      end
    end
  end
end
