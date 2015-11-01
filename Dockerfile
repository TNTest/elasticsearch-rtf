FROM java:7-jre
ENV ES_HOME=/usr/share/elasticsearch-rtf
ENV PATH $ES_HOME/bin:$PATH

#  RUN git clone -b 1.7.1 git://github.com/medcl/elasticsearch-rtf.git $ES_HOME
COPY . $ES_HOME

RUN $ES_HOME/bin/plugin -install mobz/elasticsearch-head

# ES_MAX_MEM, ES_MIN_MEM or ES_HEAP_SIZE only (max = min)
# RUN git clone https://github.com/elastic/elasticsearch-servicewrapper /usr/share/elasticsearch-servicewrapper
# RUN cp -r /user/share/elasticsearch-servicewrapper/service $ES_HOME/bin/
# RUN /user/share/elasticsearch-servicewrapper/elasticsearch64 install
# RUN service elasticsearch start

RUN mkdir -p $ES_HOME/data

VOLUME /usr/share/elasticsearch-rtf/data

COPY bin/docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 9200 9300

CMD ["elasticsearch"]
