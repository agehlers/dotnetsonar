node('sonarrunner') {

	stage('Run DotNet Sonar Analysis') {
        echo "checking out source"
        echo "Build: ${BUILD_ID}"
        checkout scm
        dir('sonar-runner') {
	    try {
                sh './scan.sh'
	    } finally {}
        }
	
    }
}
