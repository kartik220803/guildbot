# Use Python 3.9 slim image for better performance
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Make startup script executable
RUN chmod +x run_gbot_render.sh

# Create logs directory
RUN mkdir -p logs

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/app

# Expose port (if your bot needs to serve HTTP, adjust as needed)
EXPOSE 8080

# Run the startup script
CMD ["bash", "run_gbot_render.sh"]