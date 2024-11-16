# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /projectinit

# Copy the requirements file into the container at /projectinit
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Create necessary directories
RUN mkdir -p /projectinit/figures /projectinit/processed_data

# Copy the rest of the ressources code into the container
COPY . .

CMD python data_processing.py ./raw_data/WHR2023.csv && python data_analysis.py ./processed_data/WHR2023_cleaned.csv
