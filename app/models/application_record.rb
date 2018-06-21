class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  after_save :re_read

  def re_read
    reload
  end


  def lat_long
    as_json(only: %w[lat long]).values
  end


end
