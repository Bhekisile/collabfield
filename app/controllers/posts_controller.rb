require 'will_paginate/array'

class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def hobby
    posts_for_branch(params[:action])
  end

  def study
    posts_for_branch(params[:action])
  end

  def team
    posts_for_branch(params[:action])
  end

  private

  # def fetch_posts
  #   Post.limit(30)
  # end

  def posts_for_branch(branch)
    @categories = Category.where(branch:)
    @posts = Post.paginate(page: params[:page], per_page: 30)
  end
end
