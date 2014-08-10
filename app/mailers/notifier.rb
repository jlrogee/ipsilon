class Notifier < ActionMailer::Base
  default from: "noreply@vicpo.kz"
  def welcome(pecipient)
    @account = pecipient
    mail(to: pecipient)
  end

  def change_state_problem(resource)
    @resource = resource
    mail(to: resource.create_user.email)
  end

end
