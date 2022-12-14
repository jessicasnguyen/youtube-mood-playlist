class Api::TagsController < ApplicationController
    before_action :set_tag, only: [:show, :update, :destroy]

    def index
        render json: Tag.all
    end

    def show
        render json: @tag
    end

    def create
        tag = Tag.new(tag_params)

        if tag.save
            render json: tag
        else
            render json: {errors: tag.errors.full_messages}, status: 422
        end
    end

    def update
        if (@tag.update(tag_params))
            render json: @tag
        else
            render json: {errors: @tag.errors.full_messages}, status: 422
        end
    end

    def destroy
        @tag.destroy
    end

    private

    def set_tag
        @tag = Tag.find(params[:id])
    end

    def tag_params
        params.require(:tag).permit(:name)
    end

end
