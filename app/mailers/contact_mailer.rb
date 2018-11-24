class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail to: "kkuroto@gmail.com", subject: "投稿確認メール"
  end
end
