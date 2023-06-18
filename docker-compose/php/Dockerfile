FROM php:8.1-fpm

# Arguments defined in docker-compose.yml
#ARG user
#ARG uid

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libjpeg-dev \
    libwebp-dev \
    zip \
    unzip

RUN apt-get install -y \
    libwebp-dev \
    libjpeg62-turbo-dev \
    libpng-dev libxpm-dev \
    libfreetype6-dev
# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*


# Install PHP extensions
#RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath
    #gd
#RUN docker-php-ext-configure gd \
#    --with-gd \
#    --with-webp-dir \
#    --with-jpeg-dir  \
# Install the PHP gd library
#RUN docker-php-ext-configure gd \
#        --prefix=/usr \
#        --with-jpeg \
#        --with-webp
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath

RUN docker-php-ext-configure gd --enable-gd --prefix=/usr --with-jpeg --with-freetype \
    && docker-php-ext-install -j$(nproc) gd

RUN php -r 'var_dump(gd_info());'

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
#RUN useradd -G www-data,root -u $uid -d /home/$user $user
#RUN mkdir -p /home/$user/.composer && \
#    chown -R $user:$user /home/$user


# Set the user
RUN usermod -u 1000 www-data

# Set working directory
WORKDIR /var/www

# Copy your files
COPY ../.. .
# You can use "." as a destination since you already changed the workdir
