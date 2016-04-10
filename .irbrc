require 'irb/ext/save-history'
require 'irb/completion'
require 'awesome_print'
AwesomePrint.irb!

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 10_000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true

Rails.application.eager_load! if ENV.include?('RAILS_ENV')
