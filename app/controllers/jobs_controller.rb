class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.all.sort_by &:created_at
    @jobs = Job.search(params[:query]).sort_by &:created_at if params[:query].present?
  end

  def show
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(user_params)
    if @job.save
      redirect_to job_path(@job)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @job.update(user_params)
      redirect_to job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end



  # Help scrapping:
  # http://stackoverflow.com/questions/40563276/how-do-i-save-the-scraped-data-from-nokogiri-to-a-rails-database
  # doc = Nokogiri::HTML(open(@scrapper.url ))
  # items = doc.css(".s-item-container")
  # items.each do |item|
  #   Product.create!(
  #       title: item.css(".s-access-title").text.strip,
  #       price: item.css(".s-price").text.to_d,
  #       rating: item.css("span+ .a-text-normal").text.to_f)
  # end
end

