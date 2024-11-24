# Use official Ubuntu base image
FROM ubuntu:latest

# Maintainer of the Dockerfile
LABEL authors="noodlemind"

# Update and install necessary packages (e.g., curl, python)
RUN apt-get update && apt-get install -y \
    curl \
    python3 \
    python3-pip && \
    apt-get clean

# Copy the application code to the /app directory
COPY . /app
WORKDIR /app

# Install any Python dependencies
RUN pip3 install -r requirements.txt

# Command to run the application (assuming app.py as entry point)
CMD ["python3", "app.py"]

# Optional: expose the port the application runs on
EXPOSE 8080