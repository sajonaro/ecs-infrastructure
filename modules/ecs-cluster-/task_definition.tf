
locals {
  service_task_container_definitions_template = coalesce(
    var.service_task_container_definitions,
    file("${path.module}/template.json.tpl"))
  service_task_container_definitions = replace(
    replace(
        replace(
            replace(
                replace(
                    replace(
                        replace(
                            replace(
                                local.service_task_container_definitions_template,
                                "$${name}", var.service_name),
                            "$${image}", var.service_image),
                        "$${command}", jsonencode(var.service_command)),
                    "$${port}", var.service_port),
                "$${region}", var.region),
            "$${RAM}", var.ram),
        "$${CPU}", var.cpu),
    "$${log_group}", var.include_log_group == "yes" ? aws_cloudwatch_log_group.service[0].name : "")
}

resource "aws_ecs_task_definition" "task" {
  family                = "${var.application_name}-${var.service_name}-${var.deployment_identifier}"
  container_definitions = local.service_task_container_definitions

  network_mode = var.service_task_network_mode
  requires_compatibilities = ["FARGATE", "EC2"]
  pid_mode     = var.service_task_pid_mode

  task_role_arn = var.service_role

  dynamic "volume" {
    for_each = var.service_volumes
    content {
      name      = volume.value.name
      host_path = lookup(volume.value, "host_path", null)
    }
  }
}
