# Use the official Python image
FROM python:3.13-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install additional packages for Python 3.13 compatibility
RUN apt-get update && apt-get install -y python3-distutils

# Copy the entire project
COPY . .

# Run database migrations
RUN python manage.py migrate

# Expose the application port
EXPOSE 8000

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

