#!/bin/bash

cat > /home/ec2-user/cert.pem <<- "EOF"
${private_key_pem}
EOF

chmod 600 /home/ec2-user/cert.pem
chown ec2-user:ec2-user /home/ec2-user/cert.pem

cat > /etc/hosts <<- "EOF"
${rest_proxy_addresses} rest-proxy
${kafka_connect_addresses} kafka-connect
${ksql_server_addresses} ksql-server
${control_center_addresses} control-center
${spring_server_addresses} spring-server
${song_helper_addresses} song-helper
EOF

yum update -y
amazon-linux-extras install redis4.0 -y
