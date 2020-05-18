
# Run nginx-proxy with letsencrypt companion ./nginx-proxy-letsencrypt.ps1 <email@hostnametoregister>
# once run launch your target containers with env vars LETSENCRYPT_HOST, VIRTUAL_HOST set to the target domain
# see proxied-sample.ps1
# NOTE letsencrypt needs to resolve the domainname to the host in order to work, you can use on local dev machine
# by modifying /etc/nginx/config.d/default.conf running: sed -i 's/return 500;/location \/ \{ proxy_pass http://<domainname>;  \}/g' default.conf

$Email = $args[0]

# step 1
docker run --detach --name nginx-proxy --publish 80:80 --publish 443:443 --volume /etc/nginx/certs --volume /etc/nginx/vhost.d --volume /usr/share/nginx/html --volume /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy

# step 2
docker run --detach --name nginx-proxy-letsencrypt --volumes-from nginx-proxy --volume /var/run/docker.sock:/var/run/docker.sock:ro --env "DEFAULT_EMAIL=$Email" jrcs/letsencrypt-nginx-proxy-companion

# step 3 - see nginx-proxied-sample.ps1