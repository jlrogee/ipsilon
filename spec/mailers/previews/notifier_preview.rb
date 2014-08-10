class NotifierPreview < ActionMailer::Preview
  def welcome
    user = FactoryGirl.build(:user)
    Notifier.welcome(user)
  end
end