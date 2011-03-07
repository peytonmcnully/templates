############## plugin commands #################
 
# Attachments with no extra database tables, only one library to install for image processing
plugin 'paperclip', :git => "git://github.com/thoughtbot/paperclip.git"
 
 
 
##############  commands #################
 
# Installs JQuery 1.4.2.
run "curl -L http://code.jquery.com/jquery-1.4.2.min.js > public/javascripts/jquery.js"
# Installs JQuery Form Plugin 2.43
run "curl -L http://github.com/malsup/form/raw/master/jquery.form.js?v2.43 > public/javascripts/jquery.form.js"

# Install blueprint 
run "git clone https://peytonmcnully@github.com/peytonmcnully/blueprint-css.git public/stylesheets/blueprint"
 
# Cleans up a lot of the files that might clutter your app when you start.
run "rm README"
run "rm public/index.html"
run "rm public/favicon.ico"
run "rm public/robots.txt"

generate :controller, "main index"

file 'app/views/layouts/main.html.erb', 
%q{<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
  <title>App Title</title>
	<%= stylesheet_link_tag 'style', :media => 'screen, projection' %>
	<%= stylesheet_link_tag 'blueprint/screen.css', :media => 'screen, projection' %>
	<%= stylesheet_link_tag 'blueprint/print.css', :media => 'print' %>
	<!--[if lt IE 8]> <%= stylesheet_link_tag 'blueprint/ie.css', :media => 'screen, projection' %> <![endif]-->
</head>
<body>
	<div class="container">
		<p class="span-24 last" style="color: green"><%= flash[:notice] %></p>
		<%= yield %>
	</div>
</body>
</html>
}
file 'public/stylesheets/style.css',
%q{
}
route "map.root :controller => 'main'"
run "git init"
run "git add ."
run "touch README"
# Setup decent default gitignores
run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
  run %{find . -type d -empty | grep -v "vendor" | grep -v ".git" | grep -v "tmp" | xargs -I xxx touch xxx/.gitignore}
  file '.gitignore', <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END
run "git commit -m 'baseline'"
repo_field = ask("repo name?")
run "git remote add origin https://peytonmcnully@github.com/peytonmcnully/" + repo_field + ".git"
run "git push -u origin master"