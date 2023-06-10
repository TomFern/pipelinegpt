FROM python:3.9
WORKDIR /app
COPY src/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY src/ .
EXPOSE 8000
# CMD ["flask", "run"]
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "wsgi:app"]
