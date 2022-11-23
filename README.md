# GH Action for Aiven Terraform Provider

This repo demonstrate how to use Github Actions to apply Terraform configuration files and create resources in your Aiven account. It's based on this [GH Action](https://github.com/marketplace/actions/terraform_state_artifact) 

## Set your Aiven token and your encryption key

Be sure to have an Aiven auth token ready, go to your github settings -> Secrets -> Actions , and a new secret named `AIVEN_TOKEN`.
Also to maintain the terraform state, the action will use GH Artifacts and encrypt it, it needs a encryption key for this, put whatever value you want, `ENCRYPTIONKEY`

![](secrets.png)

## Push to test

Push a new terraform configuration file or update the existing one and you should see the GH Action start running and services appearing on your Aiven Console.
For instance, you can try to add a new Kafka Topic in `kafka.tf` like : 

```
resource "aiven_kafka_topic" "topic-some-other-topic" {
  project      = "dev-sandbox"
  service_name = aiven_kafka.sblanc-kafka-terraform-test.service_name
  topic_name   = "some-other-topic"
  partitions   = 3
  replication  = 2
}

```



