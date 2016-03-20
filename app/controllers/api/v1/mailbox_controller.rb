class Api::V1::MailboxController < ApiController
  before_action :set_user

  def inbox
    @inbox = @user.mailbox.inbox
    @active = :inbox
  end

  def compose
    receiver = User.find(params[:receiver_id])
    @user.send_message(receiver, params[:message], params[:subject])
  end

  def sent
    @sent = @user.mailbox.sentbox
    @active = :sent
  end

  def trash
    @trash = @user.mailbox.trash
    @active = :trash
  end

  def set_user
    @user = User.find_by_authentication_token(params[:user_token])
  end


  def unread_messages_count
    # how to get the number of unread messages for the current user
    # using mailboxer
    @user.mailbox.inbox(unread: true).count(:id, distinct: true)
  end
end