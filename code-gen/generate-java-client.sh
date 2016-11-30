#! /bin/bash

if [ -e "swagger-codegen-cli.jar" ]
then
    echo 'swagger client is present, let us use it.'
else
    echo 'swagger client is not present, let us download it.'
    curl http://repo1.maven.org/maven2/io/swagger/swagger-codegen-cli/2.2.1/swagger-codegen-cli-2.2.1.jar -o swagger-codegen-cli.jar
fi

rm -rf target/java-client/
java -jar swagger-codegen-cli.jar generate -l java -i ../swagger.yaml -c java-client-config.json -o target/java-client/