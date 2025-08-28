FROM confluentinc/cp-kafka-connect:7.2.15
#FROM confluentinc/cp-kafka-connect-jdbc:7.7.0

# Instalar conector JDBC
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest
