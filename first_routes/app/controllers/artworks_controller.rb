class ArtworksController < ApplicationController
    def index
        if params[:user_id]
            artworks = Artwork.artworks_for_user_id(params[:user_id])
            artwork_shares = ArtworkShare.artwork_shares_for_user_id(params[:user_id])
            render json: artworks + artwork_shares
        else
            render json: Artwork.all
        end
    end

   
    def create
        artwork = Artwork.new(params.require(:artwork).permit(:artist_id,:title,:image_url))
        if artwork.save
          render json: artwork
        else
          render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
      end

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def update 

        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            redirect_to artwork_url(artwork)
        else 
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end 

    end 



    def destroy 
        artwork = Artwork.find(params[:id])
        artwork.destroy
        redirect_to artworks_url
    end 

    private 
    def artwork_params
        params.require(:artwork).permit(:artist_id,:title,:image_url)
    end 



end