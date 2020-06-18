FROM centos:7
RUN yum -y update
RUN yum -y install python3-pip
RUN yum -y install gcc gcc-c++ python3-devel openssh-clients
RUN set -ex \
    && groupadd -r -g 6640 airflow \
    && useradd -u 6640 -g 6640 -d /home/airflow airflow \
    && pip3 install -U pip setuptools wheel psycopg2-binary pyOpenSSL SQLAlchemy==1.3.15 \
    && pip3 install apache-airflow[crypto,celery,postgres,hive,jdbc,postgres,ssh]==1.10.9
RUN yum -y install postgresql
ENV AIRFLOW_HOME=/home/airflow
WORKDIR /home/airflow
USER airflow

