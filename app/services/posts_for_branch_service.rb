class PostsForBranchService
  def initialize(params)
    @search = params[:search]
    @category = params[:category]
    @branch = params[:branch]
  end

  # get posts depending on the request
  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def call
    if @category.blank? && @search.blank?
      Post.by_branch(@branch).all
    elsif @category.blank? && @search.present?
      Post.by_branch(@branch).search(@search)
    elsif @category.present? && @search.blank?
      Post.by_category(@branch, @category)
    elsif @category.present? && @search.present?
      Post.by_category(@branch, @category).search(@search)
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
