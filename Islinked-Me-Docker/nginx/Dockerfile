FROM nginx:alpine

COPY default.conf /etc/nginx/conf.d/
# COPY ssl-params.conf /etc/nginx/snippets/
COPY islinked_me_chain.crt  /etc/ssl/cert.crt
COPY islinked_me.key /etc/ssl/mykey.key 

# RUN ["nginx","-t"]
# ENTRYPOINT ["/bin/bash"]
