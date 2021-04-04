FROM python:3.8-stretch
ENV PYTHONUNBUFFERED 1

# https://nodejs.org/en/download/package-manager/
RUN curl -sL https://deb.nodesource.com/setup_10.x stretch | bash -
RUN apt-get install -y nodejs

# Install gulp
# This needs more than package.json under ./
RUN npm install -g gulp-cli
RUN npm install --save-dev gulp

# Install webpack
RUN npm install webpack@4.44.2 -g
RUN npm install webpack-cli@3.3.12 -g

# Install phantomjs (downloaded phantomjs-2.1.1-linux-x86_64.tar.bz2 from http://phantomjs.org/download.html)
# ADD phantomjs /usr/local/bin/

# Install pdftotext
#   'RUN apt-get -y install poppler-utils' installs popplar. We want xpdf instead!
#   popplar's pdftotext parses lines incorrectly.
#   See emails titled 'pdftotext on prod' on why we want xpdf 3.03 and how to build it.
# ADD pdftotext /usr/bin/

RUN apt-get update

# https://stackoverflow.com/questions/28405902/how-to-set-the-locale-inside-a-docker-container
# This fixes "locale.Error: unsupported locale setting"
RUN apt-get install -y locales locales-all

# Install libs for imagemagick to be used by Wand
RUN apt-get install -y libmagickwand-dev

RUN apt-get install -y binutils libproj-dev gdal-bin

# RUN wget https://download.osgeo.org/geos/geos-3.9.0.tar.bz2 && tar xjf geos-3.9.0.tar.bz2 && cd geos-3.9.0 && ./configure && make && make install && cd ..

# RUN wget https://download.osgeo.org/gdal/3.2.0/gdal-3.2.0.tar.gz && tar xzf gdal-3.2.0.tar.gz && cd gdal-3.2.0 && ./configure --with-python --with-proj=/usr/local && make && make install && cd ..

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
