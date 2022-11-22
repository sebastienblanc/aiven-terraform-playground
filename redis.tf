resource "aiven_redis" "sblanc-redis" {
  project                 = "dev-sandbox"
  cloud_name              = "google-northamerica-northeast1"
  plan                    = "startup-4"
  service_name            = "gcp-single-node-redis1"
  maintenance_window_dow  = "monday"
  maintenance_window_time = "10:00:00"

  redis_user_config {
    redis_maxmemory_policy = "allkeys-random"

    public_access {
      redis = true
    }
  }
}