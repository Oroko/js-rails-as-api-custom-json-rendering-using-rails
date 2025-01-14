class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds
    # render json: birds, only: %i[id name species]
    render json: birds, except: %i[created_at updated_at]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      # render json: { id: bird.id, name: bird.name, species: bird.species }
      render json: bird.slice(:id, :name, :species)
    else
      render json: { message: 'Bird not found' }
    end
  end
end
