#! /bin/bash

if [ -e "swagger-codegen-cli.jar" ]
then
    echo 'swagger client is present, let us use it.'
else
    echo 'swagger client is not present, let us download it.'
    curl http://repo1.maven.org/maven2/io/swagger/swagger-codegen-cli/2.2.1/swagger-codegen-cli-2.2.1.jar -o swagger-codegen-cli.jar
fi

rm -rf target/spring-server/
java -jar swagger-codegen-cli.jar generate -l spring -i ../swagger.yaml -c spring-server-config.json -o target/spring-server/