# Base image https://hub.docker.com/u/rocker/
FROM rocker/shiny:4.0.3

# system libraries of general use
## install debian packages
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    libxml2-dev \
    libcairo2-dev \
    libsqlite3-dev \
    libmariadbd-dev \
    libpq-dev \
    libssh2-1-dev \
    unixodbc-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libv8-dev \
    libudunits2-dev

# RUN apt-get -y update && apt-get install -y  \
#     libmysqlclient-dev \
#     libudunits2-dev libgdal-dev libgeos-dev libproj-dev

# ## update system libraries
# RUN apt-get update && \
#     apt-get upgrade -y && \
#     apt-get clean


# # install renv & restore packages
# COPY /app/packages.R /tmp/
# RUN Rscript /tmp/packages.R

# ## app folder
# RUN mkdir /root/Shiny
# COPY /app /root/Shiny


# # Install gen packages
# RUN ["chmod", "o+w", "/usr/local/lib/R/site-library"]
# COPY gen-packages gen-packages
# RUN Rscript gen-packages/install_all_pkg.R


# #expose port 
# EXPOSE 3838

# #Run the app
# CMD ["R", "-e", "options('shiny.port'=3838,shiny.host='0.0.0.0');shiny::runApp('/root/Shiny')"]