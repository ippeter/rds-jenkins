FROM python:2.7.16-alpine3.9

WORKDIR /root

RUN mkdir templates
COPY hello.html templates/hello.html
COPY rds_tester.py .
COPY requirements.txt .

RUN pip install --upgrade pip && pip install --trusted-host pypi.python.org -r requirements.txt

ENV FLASK_APP rds_tester.py

CMD ["python", "rds_tester.py"]
