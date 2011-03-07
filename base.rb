############## plugin commands #################
 
# Attachments with no extra database tables, only one library to install for image processing
plugin 'paperclip', :git => "git://github.com/thoughtbot/paperclip.git"
 
 
 
##############  commands #################
 
# Installs JQuery 1.4.2.
run "curl -L http://code.jquery.com/jquery-1.4.2.min.js > public/javascripts/jquery.js"
# Installs JQuery Form Plugin 2.43
run "curl -L http://github.com/malsup/form/raw/master/jquery.form.js?v2.43 > public/javascripts/jquery.form.js"

# Install blueprint 
run "git clone https://peytonmcnully@github.com/peytonmcnully/blueprint-css.git blueprint > public/stylesheets/"
 
# Cleans up a lot of the files that might clutter your app when you start.
run "rm README"
run "rm public/index.html"
run "rm public/favicon.ico"
run "rm public/robots.txt"