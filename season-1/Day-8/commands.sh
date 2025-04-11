sudo apt update sudo apt install rabbitmq-server -y
    2  apt update
    3  sudo apt update sudo apt install rabbitmq-server -y
    4  apt install rabbitmq-server -y
    5  sudo rabbitmq-plugins enable rabbitmq_management
    6  sudo systemctl restart rabbitmq-server
    7  sudo systemct status rabbitmq-server
    8  sudo systemctl status rabbitmq-server
    9  ls
   10  rabbitmqctl add_user ganesh ganesh sudo rabbitmqctl set_permissions -p / ganesh ".*" ".*" ".*" sudo rabbitmqctl add_queue logs_queue
   11  rabbitmqctl add_user ganesh ganesh sudo rabbitmqctl set_permissions -p / ganesh ".*" ".*" ".*"
   12  sudo rabbitmqctl add_user ganesh ganesh sudo rabbitmqctl set_permissions -p / ganesh ".*" ".*" ".*"
   13  sudo rabbitmqctl add_user admin admin
   14  sudo rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"
   15  sudo systemctl restart rabbitmq-server
   16  sudo rabbitmqctl set_user_tags admin administrator
   17  sudo systemctl restart rabbitmq-server
   18  sudo apt install -y curl
   19  curl -o rabbitmqadmin http://localhost:15672/cli/rabbitmqadmin
   20  chmod +x rabbitmqadmin
   21  sudo mv rabbitmqadmin /usr/local/bin/
   22  rabbitmqadmin declare queue name=logs_queue
   23  rabbitmqadmin list queues
   24  ls
   25  cd /home/
   26  ls
   27  cd ubuntu/
   28  ls
   29  cd
   30  ls
   31  rabbitmqadmin
   32  rabbitmqadmin list queues
   33  rabbitmqadmin declare queue name=log-queue durable=true
   34  rabbitmqadmin list queues
   35  rabbitmqadmin publish routing_key=log-queue payload="Hello from RabbitMQ!"
   36  rabbitmqadmin list queues
   37  rabbitmqadmin publish routing_key=log-queue payload="Hello from RabbitMQ!"
   38  rabbitmqadmin list queues
   39  rabbitmqadmin publish routing_key=log-queue payload="Hello from RabbitMQ!"
   40  history 