FROM wyveo/nginx-php-fpm:php72

MAINTAINER Colin Wilson "colin@wyveo.com"
RUN rm -rf /usr/share/nginx/*
RUN wget -q -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
	sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list' && \
	apt-get update && \
	apt-get install -y postgresql-client-10

# Create Craft project
RUN composer create-project craftcms/craft 							 /usr/share/nginx/
RUN composer require --prefer-dist yiisoft/yii2-redis -d /usr/share/nginx/

# Add default craft cms nginx config
ADD ./default.conf /etc/nginx/conf.d/default.conf


ADD .env.sample 	        /usr/share/nginx/.env
ADD ./config 			        /usr/share/nginx/config
RUN chown -Rf nginx:nginx /usr/share/nginx/
EXPOSE 80
