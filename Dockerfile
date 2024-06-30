FROM python:3.10.6-slim

# Create bot directory and set permissions
RUN mkdir /bot && chmod 777 /bot

# Set working directory
WORKDIR /bot

# Install dependencies
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# RUN apt-get update && \
#     apt-get install -y git wget pv jq python3-dev ffmpeg mediainfo neofetch fontconfig \
#     libgconf-2-4 libnss3 libxss1 libasound2 libgtk-3-0 libatk1.0-0 libcairo2 libpango1.0-0 libxrender1 libxtst6 fonts-liberation fonts-dejavu xvfb \
#     && rm -rf /var/lib/apt/lists/*


# Install Pyppeteer and Aria2
RUN pip install pyppeteer aria2p

# Copy your Python script and requirements
COPY . .
RUN pip3 install -r requirements.txt

# Download Chromium (if needed)
RUN pyppeteer-install

# Expose port for Aria2 (if you're using it)
EXPOSE 6800

# Run your script
CMD ["python3", "main.py"]
