FROM python:2.7.16-alpine3.9

WORKDIR /root

RUN pip install flask wtforms mysql-connector-python

RUN mkdir templates
COPY hello.html templates/hello.html
COPY rds_tester.py rds_tester.py

ENV FLASK_APP rds_tester.py

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]

