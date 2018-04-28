class VoteController < ApplicationController
  require 'resolv' #if you want get hostname

  def index
    @players = Player.all
  end

  def vote
    @player = Player.where(id: params[:id]).first
    @vote_flag = false
    if @player.present?
      ip_address = request.remote_ip
      #host_name = Resolv.getname(request.remote_ip)
      have_ticket_today = Ticket.where(ip_address: ip_address).where('created_at >= ?', Date.today).first
      if have_ticket_today.present?
        @msg = '投票也要按照基本法，一天只能投一次好么！'
        return
      else
        ticket = @player.tickets.build(ip_address: ip_address, host_name: host_name)
        if ticket.save
          @msg = '投票成功！相信你喜欢的比王会登顶第一！'
          @vote_flag = true
        else
          @msg = '发生了未知错误，老铁，我也很难受，被你点出了bug！'
        end
      end
    else
      @msg = '没有这个比崽。还有，你会不会用啊，不会用别乱点！'
    end
  end

end
