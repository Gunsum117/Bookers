class ReviewsController < ApplicationController

  def top
  end

  def index
    # viewのform_forにモデルの情報を渡す
      @review = Review.new
    # dbから全てのデータを取り出す
      @reviews = Review.all
  end


  def create
    # 入力された情報を受け取ってdbに渡す,ローカル変数
      review = Review.new(review_params)
      if review.save
      redirect_to review_path(review), notice:"posted successfully!"
      end
  end

  def show
      @review = Review.find(params[:id])
  end

  def edit
      @review = Review.find(params[:id])
  end

  def update
      review = Review.find(params[:id])
      if review.update(review_params)
         redirect_to review_path(review), notice:"edited successfully!"
      end
  end

  def destroy
      review = Review.find(params[:id])
      review.destroy
      redirect_to reviews_path
  end

private
  def review_params
    params.require(:review).permit(:title, :body)
  end


end
