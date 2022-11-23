# Kafka service
resource "aiven_kafka" "sblanc-kafka-terraform-test" {
  project                 = "dev-sanbox"
  cloud_name              = "google-northamerica-northeast1"
  plan                    = "business-4"
  service_name            = "sblanc-kafka-terraform-test"
  maintenance_window_dow  = "monday"
  maintenance_window_time = "10:00:00"
  kafka_user_config {
    kafka_connect = true
    kafka_rest    = true
    kafka_version = "3.0"
    kafka {
      group_max_session_timeout_ms = 70000
      log_retention_bytes          = 1000000000
    }
  }
}

# Kafka topic
resource "aiven_kafka_topic" "topic-customer-activity" {
  project      = "dev-sanbox"
  service_name = aiven_kafka.sblanc-kafka-terraform-test.service_name
  topic_name   = "customer-activity"
  partitions   = 3
  replication  = 2
}