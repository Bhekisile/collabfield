class MessengersController < ApplicationController
  before_action :redirect_if_not_signed_in

  def index
    @users = User.all.where.not(id: current_user)
  end

  def fetch_private_conversation
    conversation = Private::Conversation.between_users(current_user.id, params[:id])
    @conversation = conversation[0]
    respond_to do |format|
      format.js { render 'fetch_private_conversation' }
    end
  end

  def fetch_group_conversation
    @conversation = Group::Conversation.find(params[:group_conversation_id])
    respond_to do |format|
      format.js { render 'fetch_group_conversation' }
    end
  end

  def open_messenger
    @type = params[:type]
    @conversation = fetch_conversation
  end

  private

  def fetch_conversation
    ConversationForMessengerService.new({
                                          conversation_type: params[:type],
                                          user1_id: current_user.id,
                                          user2_id: params[:id],
                                          group_conversation_id: params[:group_conversation_id]
                                        }).call
  end
end
