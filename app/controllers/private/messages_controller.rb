class Private::MessagesController < ActionController::Base
  include Messages

  def index
    get_messages('private', 10)
    @user = current_user
    @is_messenger = params[:is_messenger]

    respond_to do |format|
      format.html
      format.js { render 'private/messages/load_more_messages' }
    end
  end
end
