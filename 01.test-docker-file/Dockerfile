#base image
FROM python:3.10-slim

#working directory which works inside teh cpontainer
WORKDIR /app

#copying the file from presernt directory to app directory
CPOY . /app

#running the command to install dependencies
RUN pip install -r requirements.txt

#to run the app
CMD ["python", "app.py"]

