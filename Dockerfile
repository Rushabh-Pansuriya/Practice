# Use a Python base image
FROM python:3.9-slim-buster 

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt requirements.txt 

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code 
COPY . /app/

# Expose the port on which the Flask app will run
EXPOSE 5000

# Run the Flask app
CMD ["python", "practice1.py"]
