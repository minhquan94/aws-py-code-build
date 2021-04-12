FROM python:3.8-slim

WORKDIR /
COPY bulk_fund_reservation/*.py requirements.txt *.py entrypoint.sh /


# Fix CVE-2019-25013
#RUN echo "deb http://ftp.debian.org/debian sid main" >> /etc/apt/sources.list
#RUN apt-get update && apt-get install -y apt-transport-https
#RUN apt-get -t sid install -y libc6 libc6-dev libc6-dbg
#RUN ldd --version


RUN python -m pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

RUN chmod u+x /entrypoint.sh

ENV S3_BUCKET=NONE \
    S3_KEY=NONE

ENTRYPOINT [ "/entrypoint.sh" ]