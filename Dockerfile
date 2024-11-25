# Base image - choose one based on your application
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first to leverage Docker cache
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Install test dependencies
RUN pip install pytest pytest-cov

# Run tests during build (optional)
RUN python -m pytest

# Expose port if needed
EXPOSE 8000

# Command to run the application
CMD ["python", "app.py"] 