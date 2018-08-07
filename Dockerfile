FROM python:3.6.3-stretch
ENV PYTHONUNBUFFERED 1

# https://nodejs.org/en/download/package-manager/
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs

# Install gulp
# This needs more than package.json under ./
RUN npm install -g gulp-cli
RUN npm install --save-dev gulp

# Install webpack
RUN npm install webpack@2.7.0 -g

# Install phantomjs (downloaded phantomjs-2.1.1-linux-x86_64.tar.bz2 from http://phantomjs.org/download.html)
ADD phantomjs /usr/local/bin/

# Install pdftotext
#   'RUN apt-get -y install poppler-utils' installs popplar. We want xpdf instead!
#   popplar's pdftotext parses lines incorrectly.
#   See emails titled 'pdftotext on prod' on why we want xpdf 3.03 and how to build it.
ADD pdftotext /usr/bin/
