require_dependency "blog/application_controller"

module Blog
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy] 
    before_action :set_title, only: [:index, :new, :edit]
    load_and_authorize_resource
    respond_to :html, :json
    respond_to :xml, :rss, :atom, only: :index

    def index
      @posts = Post.with_translations(I18n.locale).latest.page(params[:page])
      respond_with @posts
    end

    def show
      set_meta_tags title:       @post.title,
                    description: @post.content,
                    keywords:    @post.title
      respond_with @post
    end

    def new
      @post = Post.new
      @post.translations.build
      respond_with @post
    end

    def edit
    end

    def create
      @post = Post.new(post_params)
      flash[:notice] = t('.notice') if @post.save
      respond_with @post
    end

    def update
      flash[:notice] = t('.notice') if @post.update(post_params)
      respond_with @post
    end

    def destroy
      @post.destroy
      redirect_to posts_path, notice: t('.notice')
    end

    private
      def set_post
        @post = Post.friendly.find(params[:id])
      end

      def set_title
        set_meta_tags title: t('.title')
      end

      def post_params
        params.require(:post).permit(:image, category_ids: [], translations_attributes: [:id, :title, :slug, :locale, :html, :content_type, :md_file, :md_remote, :_destroy]) if params[:post]
      end
  end
end
