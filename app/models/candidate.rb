class Candidate < ActiveRecord::Base
validates :name, presence: true
validates :party, presence: true

has_many :votes

  def as_json(options)
    hash = {id: id,
            name: name,
            party: party }
    if options[:include_token]
      hash.merge!(token: token)
    end

    {candidate: hash}
  end
end
