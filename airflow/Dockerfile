ARG PIP_PROGRESS_BAR="on"

FROM python:3.11.0-slim-buster
ENV PYTHONBUFFERED=1
ENV AIRFLOW_USER=airflow
ENV AIRFLOW_GROUP=airflow
ENV UID=5000
ENV AIRFLOW_DIR=/app
ENV SHARED_DIR=${AIRFLOW_DIR}/shared
ENV SRC_DIR=${AIRFLOW_DIR}/src
ENV AIRFLOW_HOME=${AIRFLOW_DIR}/airflow
ENV DEBIAN_FRONTEND=noninteractive
ENV AIRFLOW_PIP_VERSION=23.2.1
ENV AIRFLOW_VERSION=2.7.0
ENV PYTHONPATH=${SRC_DIR}


RUN apt-get update -y
RUN apt-get dist-upgrade -y
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y -q apt-utils
RUN apt-get install -y -q apt-transport-https
RUN apt-get install -y -q locales

RUN apt-get install -y -q --no-install-recommends ca-certificates
RUN apt-get install -y -q --no-install-recommends curl
RUN apt-get install -y -q --no-install-recommends python-greenlet
RUN apt-get install -y -q --no-install-recommends dumb-init
RUN apt-get install -y -q --no-install-recommends freetds-bin
RUN apt-get install -y -q --no-install-recommends gosu
RUN apt-get install -y -q --no-install-recommends krb5-user
RUN apt-get install -y -q --no-install-recommends ldap-utils
RUN apt-get install -y -q --no-install-recommends libldap-2.4-2
RUN apt-get install -y -q --no-install-recommends libsasl2-2
RUN apt-get install -y -q --no-install-recommends libsasl2-modules
RUN apt-get install -y -q --no-install-recommends libssl-dev
RUN apt-get install -y -q --no-install-recommends libc6
RUN apt-get install -y -q --no-install-recommends lsb-release
RUN apt-get install -y -q --no-install-recommends netcat
RUN apt-get install -y -q --no-install-recommends openssh-client
RUN apt-get install -y -q --no-install-recommends rsync
RUN apt-get install -y -q --no-install-recommends sasl2-bin
RUN apt-get install -y -q --no-install-recommends sqlite3
RUN apt-get install -y -q --no-install-recommends sudo
RUN apt-get install -y -q --no-install-recommends db-util
RUN apt-get install -y -q --no-install-recommends db5.3-util
RUN apt-get install -y -q --no-install-recommends gnupg2
RUN apt-get install -y -q --no-install-recommends gnupg
RUN apt-get install -y -q --no-install-recommends unixodbc
RUN apt-get install -y -q --no-install-recommends unixodbc-dev
RUN apt-get install -y -q --no-install-recommends libpq5
RUN apt-get install -y -q --no-install-recommends libpq-dev
RUN apt-get install -y -q --no-install-recommends postgresql-client-common
RUN apt-get install -y -q --no-install-recommends postgresql-client
RUN apt-get install -y -q --no-install-recommends default-libmysqlclient-dev
RUN apt-get install -y -q --no-install-recommends default-mysql-client
RUN apt-get install -y -q --no-install-recommends mariadb-client
RUN apt-get install -y -q --no-install-recommends zlib1g
RUN apt-get install -y -q --no-install-recommends odbcinst
RUN apt-get install -y -q --no-install-recommends pkg-config
RUN apt-get install -y -q --no-install-recommends mc
RUN apt-get install -y -q --no-install-recommends htop
RUN apt-get install -y -q --no-install-recommends build-essential

RUN apt autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt-get/lists/* \
    && rm -rf /var/log/*


RUN pip install --upgrade pip==${AIRFLOW_PIP_VERSION}

RUN pip install -U --no-cache-dir mysqlclient
RUN pip install -U --no-cache-dir gevent
RUN pip install -U --no-cache-dir flask
RUN pip install -U --no-cache-dir async
RUN pip install -U --no-cache-dir celery
RUN pip install -U --no-cache-dir boto3
RUN pip install -U --no-cache-dir markupsafe
RUN pip install -U --no-cache-dir virtualenv
RUN pip install -U --no-cache-dir pyodbc
RUN pip install -U --no-cache-dir statsd
RUN pip install -U --no-cache-dir grpcio
RUN pip install -U --no-cache-dir gunicorn

RUN pip install -U --no-cache-dir sqlalchemy
RUN pip install -U --no-cache-dir mysqlclient
RUN pip install -U --no-cache-dir psycopg[binary]
RUN pip install -U --no-cache-dir psycopg2-binary
RUN pip install -U --no-cache-dir psycopg2
RUN pip install -U --no-cache-dir kubernetes
RUN pip install -U --no-cache-dir dask
RUN pip install -U --no-cache-dir docker
RUN pip install -U --no-cache-dir elasticsearch
RUN pip install -U --no-cache-dir google
RUN pip install -U --no-cache-dir clickhouse-driver
RUN pip install -U --no-cache-dir tableauserverclient
RUN pip install -U --no-cache-dir slack_sdk
RUN pip install -U --no-cache-dir postgres
RUN pip install -U --no-cache-dir redis
RUN pip install -U --no-cache-dir rabbit
RUN pip install -U --no-cache-dir sendgrid
RUN pip install -U --no-cache-dir pendulum
RUN pip uninstall pycrypto
RUN pip uninstall crypto
RUN pip install -U --no-cache-dir pycryptodome

RUN pip install -U --no-cache-dir airflow-clickhouse-plugin
RUN pip install -U --no-cache-dir apache-airflow-providers-amazon
RUN pip install -U --no-cache-dir apache-airflow-providers-celery
RUN pip install -U --no-cache-dir apache-airflow-providers-elasticsearch
RUN pip install -U --no-cache-dir apache-airflow-providers-ftp
RUN pip install -U --no-cache-dir apache-airflow-providers-google
RUN pip install -U --no-cache-dir apache-airflow-providers-grpc
RUN pip install -U --no-cache-dir apache-airflow-providers-hashicorp
RUN pip install -U --no-cache-dir apache-airflow-providers-http
RUN pip install -U --no-cache-dir apache-airflow-providers-imap
RUN pip install -U --no-cache-dir apache-airflow-providers-mysql
RUN pip install -U --no-cache-dir apache-airflow-providers-odbc
RUN pip install -U --no-cache-dir apache-airflow-providers-postgres
RUN pip install -U --no-cache-dir apache-airflow-providers-redis
RUN pip install -U --no-cache-dir apache-airflow-providers-sendgrid
RUN pip install -U --no-cache-dir apache-airflow-providers-sftp
RUN pip install -U --no-cache-dir apache-airflow-providers-slack
RUN pip install -U --no-cache-dir apache-airflow-providers-sqlite
RUN pip install -U --no-cache-dir apache-airflow-providers-ssh
RUN pip install -U --no-cache-dir apache-airflow-backport-providers-tableau
RUN pip install -U --no-cache-dir apache-airflow-providers-tableau


RUN AIRFLOW_PYTHON_VERSION="$(python --version | cut -d " " -f 2 | cut -d "." -f 1-2)"; \
    CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${AIRFLOW_PYTHON_VERSION}.txt"; \
    pip install "apache-airflow==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"

RUN pip cache purge

COPY src ${SRC_DIR}

RUN groupadd --system ${AIRFLOW_GROUP} \
    && useradd --system --home-dir ${AIRFLOW_DIR} --no-create-home --no-user-group --groups ${AIRFLOW_GROUP} --uid ${UID} ${AIRFLOW_USER} \
    && mkdir -p ${SHARED_DIR} \
    && chown -R ${AIRFLOW_USER}:${AIRFLOW_GROUP} ${AIRFLOW_DIR} ${SHARED_DIR}

RUN rm -rf /tmp/* /var/tmp/* /var/lib/apt-get/archive/* /var/lib/apt-get/lists/*


WORKDIR ${SRC_DIR}

EXPOSE 8080

USER ${AIRFLOW_USER}