resource "aws_ecs_cluster" "xray" {
  name = "xray"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_task_definition" "xray" {
  family = "xray"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512

  volume {
    name = "xray-config-volume"
  }

  container_definitions = jsonencode([
    {
      name      = "xray"
      image     = "teddysun/xray:25.7.26"
      essential = true
      environment = []

      portMappings = [
        {
          containerPort = 443
          hostPort      = 443
        }
      ]
      dependsOn = [
        {
          condition     = "COMPLETE"
          containerName = "xray-config"
        }
      ]
      mountPoints = [
        {
          containerPath = "/etc/xray"
          sourceVolume  = "xray-config-volume"
        }
      ]
    },
    {
      name  = "xray-config"
      image = "openformation/envsubst:0.21"
      essential = false
      environment = [
        {
          name  = "XRAY_CONFIG"
          value = base64encode(templatefile("files/xray-config.json.tftpl", { xray_clients=var.xray_clients }))
        },
      ]

      mountPoints = [
        {
          containerPath = "/etc/xray"
          sourceVolume  = "xray-config-volume"
        }
      ]

      command = [
        "bash",
        "-c",
        "echo $XRAY_CONFIG | base64 -d - | tee /tmp/config.yaml.template > /dev/null && envsubst < /tmp/config.yaml.template > /etc/xray/config.json"
      ]
    }
  ])
}

resource "aws_ecs_service" "socks5" {
  count = 0
  name            = "socks5"
  cluster         = aws_ecs_cluster.xray.id
  task_definition = aws_ecs_task_definition.xray.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets = [aws_default_subnet.default_a.id]
    assign_public_ip = true
  }
}

