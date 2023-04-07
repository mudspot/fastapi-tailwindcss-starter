FROM python:3.10-slim

# Set environment variables.
ARG stage
ENV STAGE=$stage
ENV PYTHONWRITEBYTECODE 1
ENV PYTHONBUFFERED 1

COPY requirements*.txt entrypoint.sh /
RUN if [ "${STAGE}" = "dev" ]; then pip install -r requirements.txt -r requirements-dev.txt; else pip install -r requirements.txt; fi

USER 1000
COPY app app

ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]
