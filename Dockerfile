# Use a Python 3.12.3 Alpine base image
FROM python:3.12-alpine3.20

# Set working directory
WORKDIR /app

# Copy only required files
COPY main.py . 
COPY app.py .
COPY sainibots.txt .
COPY utils.py .
COPY vars.py .

# Install system dependencies
RUN apk add --no-cache \
    gcc \
    g++ \
    libffi-dev \
    musl-dev \
    ffmpeg \
    aria2 \
    make \
    cmake \
    wget \
    unzip \
    bash && \
    wget -q https://github.com/axiomatic-systems/Bento4/archive/v1.6.0-639.zip && \
    unzip v1.6.0-639.zip && \
    cd Bento4-1.6.0-639/build && \
    cmake .. && \
    make -j$(nproc) && \
    cp mp4decrypt /usr/local/bin/ && \
    cd ../.. && rm -rf Bento4-1.6.0-639 v1.6.0-639.zip

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r sainibots.txt \
    && pip install --no-cache-dir -U yt-dlp

# Expose port if needed (for web interface)
EXPOSE 8080

# Start your main bot script
CMD ["python3", "main.py"]
