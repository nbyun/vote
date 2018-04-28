class Admin::TicketsController < Admin::AdminBaseController
  before_action :set_ticket, only: [:destroy]

  def index
    @tickets = Ticket.all
  end

  def destroy
    respond_to do |format|
      if  @ticket.destroy
        flash[:notice] = I18n.t('messages.delete_success')
        format.html { redirect_to admin_tickets_url}
        format.json { head :no_content }
      else
        flash[:error] = I18n.t('messages.delete_failed')
        format.html { redirect_to admin_tickets_url}
      end
    end
  end

  private
  def set_ticket
    @ticket = Ticket.where(id: params[:id]).first
    if @ticket.blank?
      flash[:error] = I18n.t('messages.missing_data')
      redirect_to admin_tickets_path
      return
    end
  end
end
