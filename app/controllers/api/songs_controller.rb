class Api::SongsController < ApplicationController
    before_action :set_song, only: [:show, :update, :destroy]

    def index
        render json: Song.all
    end

    def show
        render json: @song
    end

    def create
        song = Song.new(song_params)

        if song.save
            render json: song
        else
            render json: {errors: song.errors.full_messages}, status: 422
        end
    end

    def update
        if (@song.update(song_params))
            render json: @song
        else
            render json: {errors: @name.errors.full_messages}, status: 422
        end
    end

    def destroy
        @song.destroy
    end

    private

    def set_song
        @song = Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:url)
    end

end
