class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @igcl = contact
    email = @igcl.user.email

    mail to: email, subject: "投稿確認メール"
  end
end
