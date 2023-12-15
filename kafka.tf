# Kafka service
resource "aiven_kafka" "sblanc-kafka-terraform-gh" {
  project                 = "devrel-sebastien"
  cloud_name              = "google-northamerica-northeast1"
  plan                    = "business-4"
  service_name            = "sebi-november-1"
  maintenance_window_dow  = "monday"
  maintenance_window_time = "10:00:00"
  kafka_user_config {
    kafka_connect = true
    kafka_rest    = true
    kafka {
      group_max_session_timeout_ms = 70000
      log_retention_bytes          = 1000000000
    }
  }
}

# Kafka topic
resource "aiven_kafka_topic" "topic-customer-topic" {
  project      = "devrel-sebastien"
  service_name = aiven_kafka.sblanc-kafka-terraform-gh.service_name
  topic_name   = "customer-topic"
  partitions   = 3
  replication  = 2
}

resource "aiven_kafka_topic" "topic-live-coding" {
  project      = "devrel-sebastien"
  service_name = aiven_kafka.sblanc-kafka-terraform-gh.service_name
  topic_name   = "live-coding"
  partitions   = 3
  replication  = 2
}

resource "aiven_kafka_topic" "topic-live-sefe" {
  project      = "devrel-sebastien"
  service_name = aiven_kafka.sblanc-kafka-terraform-gh.service_name
  topic_name   = "live-coding-sefe"
  partitions   = 3
  replication  = 2
}




