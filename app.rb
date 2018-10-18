require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base

enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player1 = Player.new(params[:player_1])
    player2 = Player.new(params[:player_2])
    $game = Game.new(player1, player2)
    redirect to('/play')
  end

  get '/play' do
    @game = $game
    erb :play
  end

  post '/attack_response' do
    $game.attack($game.passive_player)
    if $game.passive_player.score == 0
      redirect to('/game_over')
    else
      $game.switch_turns
      redirect to('/play2')
    end
    # $game.switch_turns
    # redirect to('/play2')
  end

  get '/play2' do
    @game = $game
    erb :play2
  end

  get '/game_over' do
    erb :game_over
  end

  # run! if app_file == $0 # only need this to run ruby app.rb; instead run with rackup config.ru
end
