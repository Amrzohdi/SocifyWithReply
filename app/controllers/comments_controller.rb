# Copyright (c) 2015, @sudharti(Sudharsanan Muralidharan)
# Socify is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_commentable, only: :create
  # respond_to :js

  def create
    @comment = @commentable.comments.new comment_params
    if @comment.save
      render file: "comments/create"
    else
      render json: @comment.errors, status: 401
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment_id = params[:id]
    @comment.destroy
  end

  def reply
    commentable= Comment.find(params[:comment_id])
    @reply = commentable.comments.new reply_params
    if @reply.save
      render file: "replies/create", format: :js
    else
      render json: @reply.errors, status: 401
    end
  end
  private
  def find_commentable
    @commentable_type = params[:commentable_type].classify
    @commentable = @commentable_type.constantize.find(params[:commentable_id])
  end

  def comment_params
    params.require(:comment).permit(:comment).merge(user: current_user)
  end

  def reply_params
    params.require(:reply).permit(:comment).merge(user: current_user)
  end
end

