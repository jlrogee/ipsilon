class Notifier < ActionMailer::Base
  default from: "noreply@vicpo.kz"

  def change_state_problem(resource)
    @resource = resource
    mail(to: resource.create_user.email)
  end

  def send_qualification_request(resource)
    @resource = resource
    mail(to: resource.create_user.email)
  end

  def send_thanks(resource)
    @resource = resource
    mail(to: resource.create_user.email)
  end
end
