module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      results = self.where(nil)
      filtering_params.each do |key, value|
        results = results.public_send("filter_by_#{key}", value) if value.present?
      end
      results
    end
  end

  def filtering_params(params)
    params.slice(:name, :weight, :age, :gender, :title, :character_in_movie, :character_in_serie)
  end

  def sorted_series
    @series_desc = Serie.order('created_at DESC').all
    @series_asc = Serie.order('created_at ASC').all
  end

  def sorted_movies
    @movies_desc = Movie.order('created_at DESC').all
    @movies_asc = Movie.order('created_at ASC').all
  end
end