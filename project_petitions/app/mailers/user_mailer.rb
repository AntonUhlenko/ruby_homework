class UserMailer < ApplicationMailer

  def petition_accepted(petition)
    @petition = petition
    @user = @petition.user
    mail to: @user.email, subject: "Ваша петиция принята на рассмотрение"
  end

  def petition_rejected(petition)
    @petition = petition
    @user = @petition.user
    mail to: @user.email, subject: "Ваша петиция отклонена"
  end

end
