# Use the official Ruby image as the base image
FROM ruby:3.0-bullseye as base

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs

# Set the working directory inside the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install dependencies using Bundler
RUN bundle install


# Copy the rest of the application code into the container
COPY . .

# Copy other necessary files
COPY config/credentials.yml.enc config/credentials.yml.enc

# Set the environment variables
ENV RAILS_ENV=development

# Expose the port on which the Rails server will run
EXPOSE 3000

# Start Rails when the container launches
CMD ["rails", "server", "-b", "0.0.0.0"]

