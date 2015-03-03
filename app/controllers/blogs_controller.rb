WillPaginate.per_page = 1
WillPaginate::ViewHelpers.pagination_options[:page_links] = false
class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.paginate(page: params[:page])
	@blogsall = Blog.all.reverse
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
	@blogsall = Blog.all.reverse
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
		flash[:success] = 'Article was successfully created.'
		format.html { redirect_to @blog }
        format.json { render :show, status: :created, location: @blog }
      else
        flash[:danger] = 'There was a problem creating the Article.'
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        flash[:success] = 'Article was successfully updated.'
		format.html { redirect_to @blog }
        format.json { render :show, status: :ok, location: @blog }
      else
        flash[:danger] = 'There was a problem updating the Article.'
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      flash[:success] = 'Article was successfully destroyed.'
	  format.html { redirect_to blogs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :description, :created_at)
    end
end
