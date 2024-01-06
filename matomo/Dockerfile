FROM matomo:4.15.1-fpm

# Install gettext for envsubst and vim
RUN apt-get update && \
    apt-get install -y gettext-base vim && \
    rm -rf /var/lib/apt/lists/*

# Copy the custom entrypoint script
COPY matomo-entrypoint.sh /matomo-entrypoint.sh

# Make the script executable
RUN chmod +x /matomo-entrypoint.sh

# Set the custom entrypoint
ENTRYPOINT ["/matomo-entrypoint.sh"]

# Default command (same as in the standard Matomo image)
# CMD ["apache2-foreground"]

# CMD ["%%CMD%%"]
# We can't ust fpm just now
CMD ["php-fpm"]
