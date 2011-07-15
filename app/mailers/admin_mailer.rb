class AdminMailer < ActionMailer::Base
  default :from => "apps@uprise.co.nz"
  default :to => "Sebastian Edwards <sebastian@uprise.co.nz>"
  
  def pricing_needed(application_form)
    @application_form = application_form
    @entity = application_form.entity
    @user = application_form.entity.user
    mail(:subject => "Pricing needed for new application")
  end
end
