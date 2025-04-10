# This is to start from the latest Ubuntu base image
FROM ubuntu:latest

# Update package lists and install two packages:
# vim a text editor which is required by the assignment
# nginx is the web server that is required for me to use
RUN apt-get update && apt-get install -y vim nginx

# Copy the custom bash script from my  project directory/host machine
# into the root of the Docker image with the same name
COPY Roj_app.sh /Roj_app.sh

# This line makes the script executable and runs it.
# This script will:
# Starts nginx
# Modifies the HTML file using sed
# Restarts nginx to apply the changes
RUN chmod +x /Roj_app.sh && /Roj_app.sh

# Opens port 80 on the container so it can serve web traffic
EXPOSE 80

# This line starts the nginx server and keeps it running in the foreground.
# This is important because without this line, the container would start and immediately exit.
CMD ["nginx", "-g", "daemon off;"]

