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
		sh ("docker run -d -p 8015:8015 ${dockerhubaccountid}/${application}:${BUILD_NUMBER} todo-app:v1.0")
	}
	
// 	stage('Run docker image'){
// 		sh("docker run -t -p 8007 ${dockerhubaccountid}/${application}:${BUILD_NUMBER}")
// 	}
	
// 	stage('Remove old images') {
// 		// remove docker pld images
// 		sh("docker rmi ${dockerhubaccountid}/${application}:latest -f")
//    }
}
