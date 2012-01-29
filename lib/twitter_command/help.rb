#!/usr/bin/env ruby

$stderr.puts <<EOS
usage:
  twitter <command>

commands:

  init: get access token
  test: check twitter api alive
  followers: get your followers' user_id
  friends: get  your friends' user_id
  users-lookup: get user's infomations
EOS
