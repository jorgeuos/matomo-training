FROM matomo:5.0.1

# Install gettext for envsubst and vim
RUN apt-get update && \
    apt-get install -y gettext-base vim unzip && \
    rm -rf /var/lib/apt/lists/*

# Copy the custom entrypoint script
COPY matomo-entrypoint.sh /matomo-entrypoint.sh

# Make the script executable
RUN chmod +x /matomo-entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
