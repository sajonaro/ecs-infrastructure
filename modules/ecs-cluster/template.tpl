[
  {
    "name":   "${name}",
    "image":  "${image}",
    "memory": "${RAM}",
    "cpu":    "${CPU}",
    "essential": true,
    "command": ${command},
    "portMappings": [
      {
        "containerPort": ${port},
        "hostPort": ${port}
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "${log_group}",
        "awslogs-region": "${region}"
      }
    }
  }
]
