require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
    session[:score] ||= 0
  end

  def score
    @letters = params[:letters].split(" ")
    @word = params[:word].upcase

    if valid_word?(@word, @letters)
      @message_type = :success
      @message = "#{@word} is a valid English word!"
      current_score = @word.length
      session[:score] += current_score
    else
      @message_type = :error
      if !can_build_word?(@word, @letters)
        @message = "can't be built out of #{@letters.join(", ")}"
      else
        @message = "does not seem to be a valid English word..."
      end
    end
  end

  private

  # mot forme a partir des lettres ?
  def can_build_word?(word, letters)
    word.chars.all? { |char| letters.include?(char) }
  end

  # mot existant ?
  def valid_word?(word, letters)
    return false unless can_build_word?(word, letters)
    # api
    url = "https://dictionary.lewagon.com/#{word.downcase}"
    user_serialized = URI.parse(url).read
    result = JSON.parse(user_serialized)
    result["found"] == true
  end
end
