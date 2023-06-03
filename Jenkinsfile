pipeline {
    agent {
        docker {
            image 'jenkins/jenkins'
            args '-u root'
        }
    }

    stages {
        stage('Prepare') {
            steps {
                // Clone your Git repository
                git branch: 'main', url: 'https://github.com/pipelinedave/coreos-kiosk.git'
            }
        }

        stage('Customize and Build') {
            steps {
                // Customize Fedora Silverblue
                sh 'su - core -c "bash customize_fedora_silverblue.sh"'

                // Build the QCOW2 image
                sh 'su - core -c "bash build_qcow2_image.sh"'
            }
        }

        stage('Export as Artifact') {
            steps {
                // Archive the QCOW2 image as an artifact
                archiveArtifacts artifacts: 'output/image.qcow2', fingerprint: true

                // Archive the Fedora Silverblue ISO as an artifact
                archiveArtifacts artifacts: './Fedora-Silverblue-ostree-x86_64-38-1.6.iso', fingerprint: true
            }
        }

        // stage('Publish to Artifactory') {
        //     steps {
        //         // Publish artifacts to Artifactory
        //         // Add your Artifactory credentials and configuration here
        //         // Use appropriate plugins to publish the artifacts
        //     }
        // }
    }
}
