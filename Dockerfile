FROM python:3.10-slim
#base image 

WORKDIR /app
#Set working dir inside container

COPY requirements.txt .
#Copy dependencies into container

RUN pip install --no-cache-dir -r requirements.txt
#Install Flask inside container

COPY . .
#copy project files into container

EXPOSE 8080
#Tell docker - app runs on port 8080

CMD ["python", "app.py"]
#Start the Flask app when container runs