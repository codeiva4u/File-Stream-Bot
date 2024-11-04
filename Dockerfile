# Use Python 3.8 as the base image
FROM python:3.8-slim

# Install system dependencies for packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential libssl-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy application files
COPY . /app

# Install virtualenv
RUN pip install virtualenv

# Create virtual environment and install dependencies
RUN virtualenv -p /usr/local/bin/python3 venv && \
    . /app/venv/bin/activate && \
    pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 8080

# Run the application with the virtual environment activated
CMD ["/app/venv/bin/python", "-m", "Adarsh"]
