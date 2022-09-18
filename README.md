# Movie Rating Prediction Algorithm

## description
This algorithm uses a database of users with missing ratings for movies and predicts user's rating for those missing movies. I used the popularity of the movie as my predictions. I was planning to use a weighted average of the ratings of users with similar tastes as the prediction but the runtime was too high, but if I had more time or when I come back to this project I am going to implement that and try to reduce the runtime. The advantage is that it is fast, the drawbacks are that it is not personal as the prediction for the movies is the same for all users. However, I still was able to get a decent amount of exact predictions.

### How to run
Clone this repo and cd into lib
```
cd Movie-rating-prediction-algorithm/lib
```
then run the main.rb with Ruby
```
ruby main.rb
```
It will show the statistics about the prediction: how many predictions were exact, off by one or less, off by more than one, the mean and stdev of the difference between the two.

If you want to change the files, change the file names to a different number in main.rb
For example:
```
cntrl_3 = Control.new('app/data/u3.base', 'app/data/u3.test')
puts "u3"
puts cntrl_3.run
```
Change u3.base to u4.base and u3.test to u4.test and change puts"u3" to puts"u4"

## Analysis
When I was running the experiments for u1, u2, and u3, I got around 6000 exactly correct and around 10000 off by less than 1 out of 20000 predictions for each of them. I feel like the accuracy was better than I thought it could be.

## Benchmarking
By using Time.now, each prediction takes about 2 seconds. The runtime for the a single prediction is O(n*log(n)) time. For k preditions is O(n)+O(log(n)*k). By increasing the size of the training set by a factor of 10 would increase the runtime by about 10 times plus a little more.

## Reflection
I enjoyed making this program because I like problem solving. I struggled with ruby syntaxes at first but I researched on the internet and it helped a lot. I think this really helped me in programming Ruby as I had some hands on experience. 
