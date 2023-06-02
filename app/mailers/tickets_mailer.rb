# frozen_string_literal: true

class TicketsMailer < ApplicationMailer
  def buy_ticket(ticket)
    @user = ticket.user
    @ticket = ticket
    mail(to: @user.email, subject: t("mailer.buy_ticket"))
  end

  def delete_ticket(ticket)
    @user = ticket.user
    @ticket = ticket
    mail(to: @user.email, subject: t("mailer.delete_ticket"))
  end
end
