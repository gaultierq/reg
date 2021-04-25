#!/usr/bin/env ruby
# frozen_string_literal: true

# This script is used in the development environment with Docker to check if the
# app database exists, and runs the database setup if it doesn't, as it is the
# case when the project runs for the first time on the development machine.
#
# We are using this custom script instead of running the
# `rake db:version  || rake db:setup` commands, as that currently leaves a
# couple of small ruby zombie processes running in the app container:
require 'rubygems'
require 'rake'
require 'bundler'

Bundler.setup(:default)

require 'active_record'
require 'pg'

def establish_connection
  ActiveRecord::Base.establish_connection
end

def database_version_i
  ActiveRecord::Migrator.current_version || -2
end

def database_version
  connection_tries ||= 3
  establish_connection
  database_version_i
rescue PG::ConnectionBad, ActiveRecord::ConnectionNotEstablished
  unless (connection_tries -= 1).zero?
    sleep(4 - connection_tries)
    retry
  end
  -1
rescue ActiveRecord::NoDatabaseError
  -2
rescue StandardError => e
  puts "error while finding the database version: #{e}"
  raise e
ensure
  ActiveRecord::Base.clear_all_connections!
end
