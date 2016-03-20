class AdminMailer < ApplicationMailer

  def new_accepted_petition(petition)
    @petition = petition
    mail to: "admin@example.com", subject: "Принята новая петиция на рассмотрение"
  end

end