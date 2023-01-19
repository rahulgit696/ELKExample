node {
	def application = "springbootapp4"
	def dockerhubaccountid = "rahulbadoni"
	stage('Clone repository') {
		checkout scm
	}

	stage('Build image') {
		app = docker.build("${dockerhubaccountid}/${application}:${BUILD_NUMBER}")
	}

	stage('Push image') {
		withDockerRegistry([ credentialsId: "rahulbadoni", url: "" ]) {
		app.push()
		app.push("latest")
	}
	}

	stage('Deploy') {
		sh ("docker run -d -p 8006:8080 -v /var/log/:/var/log/ ${dockerhubaccountid}/${application}:${BUILD_NUMBER}")
	}
	
	stage('Run docker image'){
		sh("docker run -t -p 8006 ${dockerhubaccountid}/${application}:${BUILD_NUMBER}")
	}
	
// 	stage('Remove old images') {
// 		// remove docker pld images
// 		sh("docker rmi ${dockerhubaccountid}/${application}:latest -f")
//    }
}
