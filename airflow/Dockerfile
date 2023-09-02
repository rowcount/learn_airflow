ARG PIP_PROGRESS_BAR="on"
FROM python:3.10.0-slim-buster
ENV PYTHONBUFFERED=1
ENV AIRFLOW_USER=airflow
ENV AIRFLOW_GROUP=airflow
ENV UID=5000
ENV AIRFLOW_DIR=/app
ENV SHARED_DIR=${AIRFLOW_DIR}/shared
ENV SRC_DIR=${AIRFLOW_DIR}/src
ENV AIRFLOW_HOME=${AIRFLOW_DIR}/airflow
ENV DEBIAN_FRONTEND=noninteractive
ENV AIRFLOW_VERSION=2.6.3
ENV PYTHONPATH=${SRC_DIR}
RUN apt-get update -y
RUN apt-get dist-upgrade -y
RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y -q apt-utils
RUN apt-get install -y -q apt-transport-https
RUN apt-get install -y -q locales
RUN apt-get install -y -q --no-install-recommends \
ca-certificates \
curl \
python-greenlet \
dumb-init \
freetds-bin \
gosu \
krb5-user \
ldap-utils \
libldap-2.4-2 \
libsasl2-2 \
libsasl2-modules \
libssl-dev \
libc6 \
lsb-release \
netcat \
openssh-client \
rsync \
sasl2-bin \
sqlite3 \
sudo \
db-util \
db5.3-util \
gnupg2 \
gnupg \
unixodbc \
unixodbc-dev \
libpq5 \
libpq-dev \
postgresql-client-common \
postgresql-client \
default-libmysqlclient-dev \
default-mysql-client \
mariadb-client \
zlib1g \
odbcinst \
pkg-config \
build-essential\
&& apt autoremove -yqq --purge \
&& apt-get clean \
&& rm -rf /var/lib/apt-get/lists/* \
&& rm -rf /var/log/*


RUN pip install --upgrade pip

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
RUN pip install -U --no-cache-dir mysqlclient
RUN pip install -U --no-cache-dir psycopg[binary]
RUN pip install -U --no-cache-dir psycopg2-binary
RUN pip install -U --no-cache-dir psycopg2
RUN pip install -U --no-cache-dir pymssql
RUN pip install -U --no-cache-dir pandas
RUN pip install -U --no-cache-dir openpyxl


RUN pip install -U --no-cache-dir apache-airflow-providers-http
RUN pip install -U --no-cache-dir apache-airflow-providers-mysql
RUN pip install -U --no-cache-dir apache-airflow-providers-microsoft-mssql
RUN pip install -U --no-cache-dir apache-airflow-providers-odbc
RUN pip install -U --no-cache-dir apache-airflow-providers-postgres



RUN AIRFLOW_PYTHON_VERSION="$(python --version | cut -d " " -f 2 | cut -d "." -f 1-2)"; \
    CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${AIRFLOW_PYTHON_VERSION}.txt"; \
    pip install "apache-airflow[celery,postgres]==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"


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