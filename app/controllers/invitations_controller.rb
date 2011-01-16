class InvitationsController < ApplicationController

  before_filter :require_admin

  def index
    @invites = Invitation.where(:user_id == current_user.id)
  end

  def new
  end

  def create
  end

end
