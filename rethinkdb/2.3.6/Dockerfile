FROM ubuntu:trusty

#MAINTAINER Daniel Alan Miller <dalanmiller@rethinkdb.com>
MAINTAINER  wxcsdb88 <wx_cs_db_88@163.com>

# Add the RethinkDB repository and public key
# "RethinkDB Packaging <packaging@rethinkdb.com>" http://download.rethinkdb.com/apt/pubkey.gpg
RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 3B87619DF812A63A8C1005C30742918E5C8DA04A
RUN echo "deb http://download.rethinkdb.com/apt trusty main" > /etc/apt/sources.list.d/rethinkdb.list

ENV RETHINKDB_PACKAGE_VERSION 2.3.6~0trusty

RUN apt-get update \
   && apt-get install -y rethinkdb=$RETHINKDB_PACKAGE_VERSION \
   && rm -rf /var/lib/apt/lists/*

RUN cp /etc/rethinkdb/default.conf.sample /etc/rethinkdb/instances.d/default.conf

VOLUME ["/data"]

WORKDIR /data

#CMD ["rethinkdb", "--bind", "all"]

# process cluster webui
EXPOSE 28015 29015 8080
