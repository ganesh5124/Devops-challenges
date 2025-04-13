FROM --platform="linux/amd64" python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container

COPY requirements.txt .
# Install the dependencies

RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

COPY app.py .
# Expose the port the app runs on
EXPOSE 5000