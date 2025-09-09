#!/bin/bash
# Esperar a que Kafka esté listo
cub kafka-ready -b kafka:9092 1 20

# Crear topics internos si no existen con cleanup.policy=compact
kafka-topics --bootstrap-server kafka:29092 --create --topic connect-configs \
  --partitions 1 --replication-factor 1 \
  --config cleanup.policy=compact || true

kafka-topics --bootstrap-server kafka:29092 --create --topic connect-offsets \
  --partitions 25 --replication-factor 1 \
  --config cleanup.policy=compact || true

kafka-topics --bootstrap-server kafka:29092 --create --topic connect-status \
  --partitions 5 --replication-factor 1 \
  --config cleanup.policy=compact || true

# Iniciar Kafka Connect
/etc/confluent/docker/run
