require "yaml"
require "fileutils"
require "tmpdir"

require "rubygems"

require "bundler/setup"
require "jekyll"

# Load the configuration file
CONFIG = YAML.load_file("_config.yml")

# Get and parse the date
DATE = Time.now.strftime("%Y-%m-%d")

# Directories
POSTS = "_posts"
DRAFTS = "_drafts"

desc 'create a new draft post'
task :post do
  require "highline/import"
  title = ask "Enter the title: "
  categories = ask "List the categories this post will fall under: "
  author = ask "What is your author nickname? "
  slug = "#{title.downcase.gsub(/[^\w|']+/, '-')}"
  slug_dashed = "#{slug.gsub(/[^a-zA-Z0-9\-]/, "")}"
  slug_fixed = "#{slug_dashed.gsub(/\-$/, '')}"
  post_text = ask "Enter any initial text (like an idea or thought) here if you have it ready. It will be added to the beginning of your post: "

  file = File.join(
    File.dirname(__FILE__),
    '_drafts',
    "#{slug_fixed}.md"
  )

  File.open(file, "w") do |f|
    f << <<-EOS.gsub(/^    /, '')
    ---
    layout: post
    title: \"#{title}\"
    categories: \"#{categories}\"
    author: #{author}
    ---

    #{post_text}

    EOS
  end
end

# rake publish
desc "Move a post from _drafts to _posts"
task :publish do
  extension = "md"
  files = Dir["#{DRAFTS}/*.#{extension}"]
  files.each_with_index do |file, index|
    puts "#{index + 1}: #{file}".sub("#{DRAFTS}/", "")
  end
  print "> "
  number = $stdin.gets
  if number =~ /\D/
    filename = files[number.to_i - 1].sub("#{DRAFTS}/", "")
    FileUtils.mv("#{DRAFTS}/#{filename}", "#{POSTS}/#{DATE}-#{filename}")
    puts "#{filename} was moved to '#{POSTS}'."
  else
    puts "Please choose a draft by the assigned number."
  end
end

desc 'Notify pingomatic about new posts'
task :pingomatic do
  begin
    require 'xmlrpc/client'
    puts '* Pinging ping-o-matic'
    XMLRPC::Client.new('rpc.pingomatic.com', '/').call('weblogUpdates.extendedPing', 'swiftfordesigners.net' , 'http://swiftfordesigners.net', 'http://swiftfordesigners.net/rss.xml')
  rescue LoadError
    puts '! Could not ping ping-o-matic, because XMLRPC::Client could not be found.'
  end
end

desc 'Notify Google of the new sitemap'
task :sitemapgoogle do
  begin
    require 'net/http'
    require 'uri'
    puts '* Pinging Google about our sitemap'
    Net::HTTP.get('www.google.com', '/webmasters/tools/ping?sitemap=' + URI.escape('http://swiftfordesigners.net/sitemap.xml'))
  rescue LoadError
    puts '! Could not ping Google about our sitemap, because Net::HTTP or URI could not be found.'
  end
end

desc 'Notify Bing of the new sitemap'
task :sitemapbing do
  begin
    require 'net/http'
    require 'uri'
    puts '* Pinging Bing about our sitemap'
    Net::HTTP.get('www.bing.com', '/webmaster/ping.aspx?siteMap=' + URI.escape('http://swiftfordesigners.net/sitemap.xml'))
  rescue LoadError
    puts '! Could not ping Bing about our sitemap, because Net::HTTP or URI could not be found.'
  end
end

# rake notify
desc "Notify various services about new content"
  task :ping => [:pingomatic, :sitemapgoogle, :sitemapbing] do
end

# GITHUB_REPONAME = "swiftfordesigners/swiftfordesigners.github.io"

# desc "Generate blog files"
# task :generate do
#   system "jekyll build"
# end

# desc "Generate and publish blog to master"
# task :deploy => [:generate] do
#   require "highline/import"
#   system "git add ."
#   system "git pull origin master"
#   message = ask "Enter your commit message: "
#   system "git commit -m \"#{message}\""
#   system "git push origin master"
# end



# Change your GitHub reponame
GITHUB_REPONAME = "swiftfordesigners/swiftfordesigners.github.io"

desc "Generate blog files"
task :generate do
  Jekyll::Site.new(Jekyll.configuration({
    "source"      => ".",
    "destination" => "_site"
  })).process
end

desc "Generate and publish blog to master"
task :deploy => [:generate] do
  Dir.mktmpdir do |tmp|
    cp_r "_site/.", tmp

    pwd = Dir.pwd
    Dir.chdir tmp

    system "git init"
    system "touch CNAME"
    system "echo 'swiftfordesigners.net' >> CNAME"
    system "git add ."
    message = "Site updated at #{Time.now.utc}"
    system "git commit -m #{message.inspect}"
    system "git remote add origin git@github.com:#{GITHUB_REPONAME}.git"
    system "git push origin master --force"

    Dir.chdir pwd
  end
end
