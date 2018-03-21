class MessagesController < ApplicationController
  before_action :get_messages, only: :index
  # before_action :set_conversation

  def create
    # current_user.reply_to_conversation(
    #   @conversation,
    #   params[:mailboxer_message][:body],
    #   nil,
    #   true,
    #   true,
    #   params[:mailboxer_message][:attachment]
    #   )
    # redirect_to conversation_path(@conversation)
  end

  # def create
  #   bydebug
  #   message = @chatroom.messages.new(message_params)
  #   message.user = current_user
  #   message.save
  # end

  private

  def set_conversation
    @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
  end

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end


  def get_messages
    @messages = Message.for_display
    @message  = current_user.messages.build
  end

  def render_message(message)
    render(partial: 'message', locals: { message: message })
  end
end
