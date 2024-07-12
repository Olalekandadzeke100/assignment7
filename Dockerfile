FROM python:3.8 as builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user -r requirements.txt

FROM python:3.8-slim-buster
WORKDIR /app
COPY --from=builder /root/.local /root/.local
COPY . .
CMD ['python', './app.py']
