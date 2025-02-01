# ------ Stage 1 -----------
# This is base image, getting slim python image that is light weight
FROM python:3.11-slim AS builder
WORKDIR /django-app

# First copying only requirements.txt file to install the dependencies
COPY requirements.txt .

# Adding a prefix to install the dependencies in a specified folder instead of default one
# This makes easy to copy the only required modules in later stages
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

#--------- Stage 2 ----------
#FROM python:3.11-slim 
FROM python:3.11-slim
WORKDIR /django-app

# In this stage we are copying only required dependencies from builder stage in install folder defined above
COPY --from=builder /install /usr/local
COPY . .

EXPOSE 8000
CMD [ "python", "django_project/manage.py", "runserver", "0.0.0.0:8000" ]