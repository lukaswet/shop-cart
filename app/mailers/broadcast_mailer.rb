class BroadcastMailer < ApplicationMailer
  def some
    mail(
      subject: 'test mail',
      from: 'lukaswet@gmail.com',
      to: 'lukaswet@gmail.com'
    )
  end
end
