require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base

enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    $player1 = Player.new(params[:player_1])
    $player2 = Player.new(params[:player_2])
    redirect to('/play')
  end

  get '/play' do
    @player_1 = $player1.name
    @player_2 = $player2.name
    @score = $player2.score
    erb :play
  end

  post '/attack_response' do
    @game = Game.new($player1, $player2)
    @game.attack($player2)
    redirect to('/play2')
  end

  get '/play2' do
    @player_1 = $player1.name
    @player_2 = $player2.name
    @score = $player2.score
    erb :play2
  end


  # run! if app_file == $0 # only need this to run ruby app.rb; instead run with rackup config.ru
end
