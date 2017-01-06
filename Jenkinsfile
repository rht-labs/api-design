node {
   stage('Checkout') {
      checkout scm
   }
   stage('Validate Spec') {
      def npmHome = tool 'node-4'
      sh "'${npmHome}/bin/npm' install"
      sh "'${npmHome}/bin/npm' test"
   }
   stage('Code Gen') {
      dir( 'code-gen' ){
          def mvnHome = tool 'mvn-3'
          env.JAVA_HOME = tool 'java-1.8'
          sh "'./generate-java-client.sh'"
          sh "'./generate-spring-server.sh'"
          dir ( 'target/java-client' ){
              sh "'${mvnHome}/bin/mvn' clean deploy -DaltDeploymentRepository=nexus::default::http://nexus.artifact-repository-delivery.svc.cluster.local:8081/repository/labs-releases"
          }
          dir ( 'target/spring-server' ){
              sh "'${mvnHome}/bin/mvn' clean deploy -DaltDeploymentRepository=nexus::default::http://nexus.artifact-repository-delivery.svc.cluster.local:8081/repository/labs-releases"
          }
      }
   }
}