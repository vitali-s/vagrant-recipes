# vagrant-recipes
Vagrant recipes for deployment of typical development environments.

There are following recipes are created:
- haproxy - with simple load balancing
    - Check routing: curl 127.0.0.0:8080
    - Access haproxy admin via: 127.0.0.1:8080/admin?stats (admin:admin)
- ha-proxy-multi - balancing load between 3 node.js web apps
    - Check routing: curl 127.0.0.0:8080
    - Access haproxy admin via: 127.0.0.1:8080/admin?stats (admin:admin)
    - Run performance test using vegeta (https://github.com/tsenart/vegeta):
        - $ echo "GET http://127.0.0.1:8080/" | vegeta attack -duration=30s -rate=1000 | vegeta report
        - $ echo "GET http://127.0.0.1:8080/" | vegeta attack -duration=30s -rate=1000 | vegeta report -reporter=plot > plot.html