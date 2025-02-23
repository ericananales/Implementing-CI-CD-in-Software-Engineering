# Use Python 3.8 image as base
FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Copy application files
COPY src/ /app/src
COPY requirements.txt /app/

# Upgrade pip to the latest version
RUN python -m pip install --upgrade pip

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port that Flask runs on
EXPOSE 5000

# Run the Flask app
CMD ["python", "src/app.py"]
