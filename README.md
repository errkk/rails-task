# 🛤 RAILS TASK 💎

## 📱 Welcome to Skittle, the super awesome mobile network!
This is the web API for our mobile network, Skittle.
Customers use this online tool to manage their accounts, like billing and wotnot.
Telcos are a bit complicated and slow to implement features, so we interact with those billing systems via their API.

Customers have been enjoing Skittle so much, some of them are running out of data, and want to upgrade to a new plan.

The new feature provides a list of plans in JSON format on the endpoint: `/plan/index`.
The Skittle backend fetches all available plans ever, from the billing system via their API. But unfortunatly, the vendors haven't implemented any filtering.
Some plans can only be bought for a minimum term, for example 12 months, others have a minimum term of 24 months.
We've had to implement the filtering on the Skittle backend, so that the customers get the best experince.

This won't come as much of a surprise; the feature is almost finished, but there are still a couple of kinks to work out.
Some of the tests are failing. Let's pair together to get a feel for the problem, and we can discuss what to do. We might even be able to run it.

### 🎟 Here's the ticket:
> As a customer I want to see what plans I could choose that have a minimum term that I specify

Fetch all the plans from Telco's API: `base_uri "https://fakecycle.netlify.app/.netlify/functions/plans` and retrun them our our plans endpoint for the frontend to consume.

Here is an example of a plan:
```json
  {"price":100, "currency":"GBP", "min_term": 12},
```

## 🚀 Repl.it
[![Run on Repl.it](https://repl.it/badge/github/errkk/rails-task)](https://repl.it/github/errkk/rails-task)

The plan is that we can get this running on this hosted runtime, So we don't have to faff with getting it installed locally.

# 🏃‍♀️ Running the server
Repl.it forwards port 8080

```sh
bundle exec rails s -b 0.0.0.0 -p 8080
```

# 👓 Runing the specs
```sh
bundle exec rspec
```

# 🤦‍♂️ If we have to run it locally
Using RBENV for version 2.5.1 so it can run on repl.it
If that doesn't work...
RBENV is hard, might have to run it from here.
Some or all of these at some point might help
```sh
rbenv install 2.5.1

~/.rbenv/versions/2.5.1/bin/gem install bundle
~/.rbenv/versions/2.5.1/bin/bundle
~/.rbenv/versions/2.5.1/bin/bundle exec rails s ...
~/.rbenv/versions/2.5.1/bin/bundle exec rspec
```
