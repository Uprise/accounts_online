class UserMailer < ActionMailer::Base
  default :from => "Accounts Online <info@accountsonline.co.nz>"
  
  def application_form_ready(application_form)
    @application_form = application_form
    @entity = application_form.entity
    @user = application_form.entity.user
    mail(:to => "#{@user.first_name} #{@user.last_name} <#{@user.email}>", :subject => "Your forms are ready to download")
  end
end
