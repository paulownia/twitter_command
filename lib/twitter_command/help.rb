#!/usr/bin/env ruby

$stderr.puts <<EOS
usage:
  twitter <command>

commands:

  init: get access token.
  followers: print user_ids for users following you.
  friends: print user_ids that you follow.
  screen-name: convert user_id to screen_name.
  no-retweet: print user_ids that you don't want to see retweets from.
  blocking: print user_ids that you are blocking.
  following: print ids for every user you follow who don't follow you back.

EOS
