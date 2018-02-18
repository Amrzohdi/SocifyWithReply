class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @conversation =Conversation.where(sender: current_user,recipient_id:  params[:user_id]).first_or_create
    redirect_to user_conversation_path(id: @conversation.id)
  end

  def show
    render @conversation = Conversation.find(params[:id])
  end

  private

end
