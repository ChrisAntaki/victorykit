class UnsubscribesController < ApplicationController
  
  def create
    @unsubscribe = Unsubscribe.new(params[:unsubscribe])
    @unsubscribe.cause = "unsubscribed"
    @unsubscribe.member = Member.find_by_email(@unsubscribe.email)
    
    if !@unsubscribe.member.nil? && @unsubscribe.save
      Notifications.unsubscribed @unsubscribe
      redirect_to root_url, notice: 'You have successfully unsubscribed.'
    else
      redirect_to new_unsubscribe_url, notice: 'There was a problem when we tried to unsubscribe you.'
    end
  end
  
  def new
    @unsubscribe = Unsubscribe.new
  end
  
end