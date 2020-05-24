# Pull official python image
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.7

# Declare maintainer of container
MAINTAINER yourname you@youremail.com

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /usr/src/app

# Copy requirements file
COPY ./requirements.txt /usr/src/app/requirements.txt

# Install the dependencies.
RUN pip3 install -r /usr/src/app/requirements.txt

# Copy the current directory contents into the container at
COPY . /usr/src/app

# Run application on uvicorn server on dynamic port assigned by heroku
CMD uvicorn main:app --host=0.0.0.0 --port=${PORT:-5000}
