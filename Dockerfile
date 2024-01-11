# Use the official Ruby image as the base image
FROM ruby:3.0-bullseye as base

# Set the working directory inside the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install dependencies using Bundler
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the rest of the application code into the container
COPY . .

# Set the environment variables
ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true

# Precompile assets
RUN bundle exec rake assets:precompile

# Expose the port on which the Rails server will run
EXPOSE 3000

# Start the Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
