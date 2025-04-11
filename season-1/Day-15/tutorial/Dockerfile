# Use a minimal Python Alpine-based image
FROM python:3.9-alpine

# Set working directory
WORKDIR /app

# Copy project metadata files
COPY pyproject.toml .

# Install dependencies using Poetry
RUN pip install flask --no-cache-dir

# Copy the rest of the code
COPY . .

RUN ls

# Initialize the database (if needed)
RUN flask --app flaskr init-db

# Expose Flask port
EXPOSE 5000

# Run Flask app (fixed CMD format)
CMD ["flask", "--app", "flaskr", "run", "--debug"]
