class Ratings
  # the constructor of the MovieData class accepts a single parameter, the file
  # name of the main data file. It reads the file content in.
  def initialize(file_name)
    raise "can not find file #{file_name} " unless File.exist?(file_name)

    # @file = "data/u1.base"
    @current_file = open(file_name)
    @filelist = []

    @file_hash = {} # using users as key
    @movie_hash = {} # using movies as key
  end

  def hash_user
    @current_file.each do |line| # adding the info to hash
      curr = line.split
      # hash users
      if @file_hash.has_key?(curr[0])
        for a in 1..2 do
          @file_hash[curr[0]].append curr[a] # append movie rating and movie_id
        end
      else
        @file_hash[curr[0]] = [curr[1], curr[2]]
      end
      # hash movies
      if @movie_hash.has_key?(curr[1])
        @movie_hash[curr[1]].append curr[0] # append user and their movie ratings
        @movie_hash[curr[1]].append curr[2]
      else
        @movie_hash[curr[1]] = [curr[0], curr[2]]
      end
    end
  end

  # returns an integer from 1 to 5 to indicate the popularity of a certain movie.
  def popularity(movie_id)
    rate_count = 1
    popular_rate = 0
    return 1 unless @movie_hash.has_key?(movie_id)

    until rate_count >= @movie_hash[movie_id].size - 1
      popular_rate += @movie_hash[movie_id][rate_count].to_i
      rate_count += 2
    end
    return 1 if rate_count < 2

    popular_rate / (rate_count / 2)
  end

  # generates a number between 0 and 1 indicating the similarity in movie
  # preferences between user1 and user2. 0 is no similarity.
  def similarity(user1, user2)
    similarity = []
    a = 0
    until a >= @file_hash[user1].size - 1
      b = 0
      if @file_hash.has_key?(user2)
        until b >= @file_hash[user2].size - 1
          if @file_hash[user1][a] == @file_hash[user2][b]
            # the similarity is 1-(rating1-rating2)/5
            score = ((@file_hash[user1][a + 1].to_i - @file_hash[user2][b + 1].to_i) / 5).abs
            similarity.append score
          end
          b += 2
        end
      end
      a += 2
    end
    if similarity.size == 0
      0
    else
      similarity.sum(0.0) / similarity.size
    end
  end

  # this return a list of users whose tastes are most similar to the tastes of
  # user, the score is how simiar do we want them to be
  def most_similar(user)
    user_list = []
    for a in 0..@file_hash.size do
      user_list.append a if similarity(user, a.to_s) >= 0.4
    end
    user_list
  end

  # this program predicts how the user is going to rate a movie
  def predict(_user, movie)
    # looking at the most similar users (deleted for faster result)
    # if other users never reviewed this movie, return populartiy
    popularity(movie) # will change to a better algo when I have time
  end
end
