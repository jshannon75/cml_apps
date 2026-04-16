FROM rocker/rstudio:latest

# Set environment variables
ENV PASSWORD=yourpassword \
    ROOT=TRUE \
    PORT=8787

# Install common R packages (customize as needed)
RUN install2.r --error \
    tidyverse \
    rmarkdown \
    shiny

# Cloud Run: configure RStudio Server to use the $PORT env variable
CMD ["/bin/sh", "-c", "echo 'www-port='$PORT >> /etc/rstudio/rserver.conf && /init"]

EXPOSE 8787
