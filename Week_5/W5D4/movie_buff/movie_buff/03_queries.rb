def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.

  Movie
    .joins(:actors)
    .select(:title, :id)
    .group(:id)
    .where(actors: {name: those_actors})
    .having("COUNT(*) = #{those_actors.length}")

end

def golden_age
  # Find the decade with the highest average movie score.
  Movie
    .select('(yr/10)*10 AS decade')
    .group('(yr/10)*10')
    .order('AVG(score) DESC')
    .first.decade #.limit(1)
end
#https://stackoverflow.com/questions/13779777/group-rows-by-year-band-interval

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery

  Actor
    # .joins(:castings, 'actors AS actors2 ON castings.actor_id = actors2.id')

    # .select()
    # .joins('castings AS castings1 ON actors.id = castings1.actor_id')
    # .joins('castings AS castings2 ON castings1.movie_id = castings2.movie_id')
    # .joins('actors AS actors2 ON castings2.actor_id = actors2.id')

end
  
# SELECT actors2.name
# FROM actors AS actors
# JOIN castings AS castings1 ON actors.id = castings1.actor_id
# JOIN castings AS castings2 ON castings1.movie_id = castings2.movie_id 
# JOIN actors AS actors2 ON castings2.actor_id = actors2.id
# WHERE actors.name = name AND actors2.name != name 


# actor 1 -> casting 3 (in the same movie)-> casting 3 -> actor 1 <- exclude these
# actor 1 -> casting 3 (in the same movie)-> casting 4 -> actor 5
# actor 1 -> casting 3 (in the same movie)-> casting 5 -> actor 6


def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie

end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

end
