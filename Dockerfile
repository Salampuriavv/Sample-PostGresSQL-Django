# Step 1: Use an official Python image as a base image
FROM python:3.9-slim

# Step 2: Install PostgreSQL development libraries
RUN apt-get update && apt-get install -y libpq-dev

# Step 3: Set the working directory inside the container
WORKDIR /app

# Step 4: Copy the requirements.txt file to the container
COPY requirements.txt /app/

# Step 5: Install the dependencies listed in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Step 6: Copy the rest of the application files to the container
COPY . /app/

# Step 7: Expose the port on which the app will run
EXPOSE 8000

# Step 8: Command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
