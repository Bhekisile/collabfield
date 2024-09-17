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

  def fetch_posts
    branch = params[:action]
    search = params[:search]
    category = params[:category]
  
    if category.blank? && search.blank?
      posts = Post.by_branch(branch).all
    elsif category.blank? && search.present?
      posts = Post.by_branch(branch).search(search)
    elsif category.present? && search.blank?
      posts = Post.by_category(branch, category)
    elsif category.present? && search.present?
      posts = Post.by_category(branch, category).search(search)
    else
    end
  end

  def posts_for_branch(branch)
    @categories = Category.where(branch:)
    @posts = fetch_posts.paginate(page: params[:page])
  end
end
