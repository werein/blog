require_dependency "blog/application_controller"

module Blog
  class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :update]
    load_and_authorize_resource
    respond_to :html, :json

    def show
      @posts = @category.posts.with_translations(current_locale).page(params[:page])
      set_meta_tags title:        @category.title,
                    description:  @category.content,
                    keywords:     @category.title
      respond_with  @category
    end

    def update
      flash[:notice] = t('.notice') if @category.update(category_params)
      respond_with @category
    end

    private
      def set_category
        @category = Category.friendly.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:image, translations_attributes: [:id, :title, :slug, :locale, :content, :_destroy]) if params[:category]
      end
  end
end