# This is the shebang line that pretty much tells the system to run this script using the Bash shell.
#!/usr/bin/bash

# This starts the nginx web server inside the Docker container.
# It must be running so that I can:
# -See the default web page
# -Modify the page content using sed
service nginx start

# Uses sed which stands for  stream editor
# Replaces Welcome to nginx with Welcome to Rafael's page
# all .html files inside /var/www/html/ -where nginx’s default page lives
# The -i option makes the change in-place permanently in the file.
sed -i "s/Welcome to nginx/Welcome to Rafael's page/" /var/www/html/*.html

# Replaces every occurrence of nginx with EngineX
# The g at the end means replace all matches in each line
sed -i "s/nginx/nginx (pronounced as EngineX)/g" /var/www/html/*.html

# This restarts the nginx service so that:
# -Any changes to the HTML file are served immediately
# - The modified content appears when you visit the page
service nginx restart
