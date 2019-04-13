# vim: set ft=ruby

# === EDITOR ===
Pry.editor = 'vim'

Pry.config.color = true
Pry.config.theme = "solarized"

# === CUSTOM PROMPT ===
# This prompt shows the ruby version (useful for RVM)
# Pry.prompt = [proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

# === Listing config ===
# Better colors - by default the headings for methods are too 
# similar to method name colors leading to a "soup"
# These colors are optimized for use with Solarized scheme 
# for your terminal
Pry.config.ls.separator = "\n" # new lines between methods
Pry.config.ls.heading_color = :magenta
Pry.config.ls.public_method_color = :green
Pry.config.ls.protected_method_color = :yellow
Pry.config.ls.private_method_color = :bright_black

# # == PLUGINS ===
# # awesome_print gem: great syntax colorized printing
# # look at ~/.aprc for more settings for awesome_print
# require 'rubygems'
# # require 'interactive_editor'
# begin
#   # require 'awesome_print'
#   # require 'awesome_print_colors'
# 
#   # AwesomePrint.defaults={ 
#   #               :theme=>:solorized,
#   #               :indent => 2,
#   #               :sort_keys => true,
#   #               :color => {
#   #                 :args       => :greenish,
#   #                 :array      => :pale,
#   #                 :bigdecimal => :blue,
#   #                 :class      => :yellow,
#   #                 :date       => :greenish,
#   #                 :falseclass => :red,
#   #                 :fixnum     => :blue,
#   #                 :float      => :blue,
#   #                 :hash       => :pale,
#   #                 :keyword    => :cyan,
#   #                 :method     => :purpleish,
#   #                 :nilclass   => :red,
#   #                 :string     => :yellowish,
#   #                 :struct     => :pale,
#   #                 :symbol     => :cyanish,
#   #                 :time       => :greenish,
#   #                 :trueclass  => :green,
#   #                 :variable   => :cyanish
#   #             }
#   #          }
# 
#   # AwesomePrint.defaults={:theme=>:solorized}
# 
#   begin
#       require 'pry-clipboard'
#         # aliases
#       Pry.config.commands.alias_command 'ch', 'copy-history'
#       Pry.config.commands.alias_command 'cr', 'copy-result'
#   rescue LoadError => e
#       warn "can't load pry-clipboard"
#       #       end'
#   end
# 
# 
#   # The following line enables awesome_print for all pry output,
#   # and it also enables paging
#   Pry.config.print = proc {|output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output)}
# 
#   # If you want awesome_print without automatic pagination, use the line below
#   # Pry.config.print = proc { |output, value| output.puts value.ai }
# rescue LoadError => err
#   puts "gem install awesome_print  # <-- highly recommended"
# end
# 
# # require 'gist'
# 
# # === CUSTOM COMMANDS ===
# # from: https://gist.github.com/1297510
# default_command_set = Pry::CommandSet.new do
#   command "copy", "Copy argument to the clip-board" do |str|
#      IO.popen('pbcopy', 'w') { |f| f << str.to_s }
#   end
# 
#   command "clear" do
#     system 'clear'
#     if ENV['RAILS_ENV']
#       output.puts "Rails Environment: " + ENV['RAILS_ENV']
#     end
#   end
# 
#   command "sql", "Send sql over AR." do |query|
#     if ENV['RAILS_ENV'] || defined?(Rails)
#       pp ActiveRecord::Base.connection.select_all(query)
#     else
#       pp "No rails env defined"
#     end
#   end
#   command "caller_method" do |depth|
#     depth = depth.to_i || 1
#     if /^(.+?):(\d+)(?::in `(.*)')?/ =~ caller(depth+1).first
#       file   = Regexp.last_match[1]
#       line   = Regexp.last_match[2].to_i
#       method = Regexp.last_match[3]
#       output.puts [file, line, method]
#     end
#   end
# end
# 
# Pry.config.commands.import default_command_set
# 
# refinery_command_set = Pry::CommandSet.new do
# 
#   command 'init' do
#     DataImports.models(Refinery::Page,Refinery::Shop::Category,Refinery::Shop::Product)
#   end
#   command 'exp' do
#     DataImports.export_samples
#   end
#   command 'imp' do
#     DataImports.import("Refinery::Shop::Product")
#   end
#   command "what_i_want" do
#     str="Dont know what I want but I know how to get it"
#     ap str
#     ap str[/(\w+) want/]
#     ap str[/(?<a>\w+) want/, :a]
#     /(?<a>\w+) want/ =~ str
#     ap a
#   end
# 
#   command "get_test_data" do  
#     require 'nokogiri'
#     
#     @p = Refinery::Shop::Product.find 'l-tyrosine-500-mg-60-caps'
#     @t = @p.description
#     @d = Nokogiri::HTML(@t)
#     @w = @d.css("div#contents")
#   end
# end
# 
# Pry.config.commands.import refinery_command_set
# 
# # === CONVENIENCE METHODS ===
# # Stolen from https://gist.github.com/807492
# # Use Array.toy or Hash.toy to get an array or hash to play with
# class Array
#   def self.toy(n=10, &block)
#     block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
#   end
# end
# 
# class Hash
#   def self.toy(n=10)
#     Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
#   end
# end
# 
# # === COLOR CUSTOMIZATION ===
# # Everything below this line is for customizing colors, you have to use the ugly
# # color codes, but such is life. 
# CodeRay.scan("example", :ruby).term # just to load necessary files
# # Token colors pulled from: https://github.com/rubychan/coderay/blob/master/lib/coderay/encoders/terminal.rb
# TERM_TOKEN_COLORS = {
#         :attribute_name => '33',
#         :attribute_value => '31',
#         :binary => '1;35',
#         :char => {
#           :self => '36', :delimiter => '34'
#         },
#         :class => '1;35',
#         :class_variable => '36',
#         :color => '32',
#         :comment => '37',
#         :complex => '34',
#         :constant => ['34', '4'],
#         :decoration => '35',
#         :definition => '1;32',
#         :directive => ['32', '4'],
#         :doc => '46',
#         :doctype => '1;30',
#         :doc_string => ['31', '4'],
#         :entity => '33',
#         :error => ['1;33', '41'],
#         :exception => '1;31',
#         :float => '1;35',
#         :function => '1;34',
#         :global_variable => '42',
#         :hex => '1;36',
#         :include => '33',
#         :integer => '1;34',
#         :key => '35',
#         :label => '1;15',
#         :local_variable => '33',
#         :octal => '1;35',
#         :operator_name => '1;29',
#         :predefined_constant => '1;36',
#         :predefined_type => '1;30',
#         :predefined => ['4', '1;34'],
#         :preprocessor => '36',
#         :pseudo_class => '34',
#         :regexp => {
#           :self => '31',
#           :content => '31',
#           :delimiter => '1;29',
#           :modifier => '35',
#           :function => '1;29'
#         },
#         :reserved => '1;31',
#         :shell => {
#           :self => '42',
#           :content => '1;29',
#           :delimiter => '37',
#         },
#         :string => {
#           :self => '36',
#           :modifier => '1;32',
#           :escape => '1;36',
#           :delimiter => '1;32',
#         },
#         :symbol => '1;31',
#         :tag => '34',
#         :type => '1;34',
#         :value => '36',
#         :variable => '34',
#         
#         :insert => '42',
#         :delete => '41',
#         :change => '44',
#         :head => '45'
# }
# 
# module CodeRay
#     module Encoders
#         class Terminal < Encoder
#             # override old colors
#             TERM_TOKEN_COLORS.each_pair do |key, value|
#                 TOKEN_COLORS[key] = value
#             end
#         end
#     end
# end