class Private::ConversationsController < ApplicationController
  def index
    gon.last_visible_chat_window = @last_visible_chat_window || 0
    gon.hidden_chats = @hidden_chats || 0
  end

  def create
    recipient_id = Post.find(params[:post_id]).user.id
    @conversation = Private::Conversation.new(sender_id: current_user.id,
                                              recipient_id:)
    if @conversation.save
      Private::Message.create(user_id: recipient_id,
                              conversation_id: @conversation.id,
                              body: params[:message_body])
      respond_to do |format|
        format.js { render partial: 'posts/show/contact_user/message_form/success' }
        # render partial: 'posts/show/contact_user/message_form/success'

        add_to_conversations unless already_added?
      end
    else
      respond_to do |format|
        format.js { render partial: 'posts/show/contact_user/message_form/fail' }
        # render partial: 'posts/show/contact_user/message_form/fail'
      end
    end
  end

  def close
    @conversation_id = params[:id].to_i
    session[:private_conversations].delete(@conversation_id)

    respond_to do |format|
      format.js { render partial: 'private/conversations/close' }
    end
  end

  private

  def add_to_conversations
    session[:private_conversations] ||= []
    session[:private_conversations] << @conversation.id
  end

  def already_added?
    session[:private_conversations].include?(@conversation.id)
  end
end
