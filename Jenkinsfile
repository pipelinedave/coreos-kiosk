pipeline {
    agent any

    stages {
        stage('Prepare') {
            steps {
                // Clone your Git repository
                git 'https://github.com/pipelinedave/coreos-kiosk.git'

                // Optional: Switch to a specific branch or tag
                checkout('main')
            }
        }

        stage('Customize and Build') {
            steps {
                // Customize Fedora Silverblue
                sh ' sudo -u core customize_fedora_silverblue.sh'

                // Build the QCOW2 image
                sh 'sudo -u core bash build_qcow2_image.sh'
            }
        }

        stage('Export as Artifact') {
            steps {
                // Archive the QCOW2 image as an artifact
                archiveArtifacts artifacts: 'output/image.qcow2', fingerprint: true

                // Archive the Fedora Silverblue ISO as an artifact
                archiveArtifacts artifacts: 'path/to/FedoraSilverblue.iso', fingerprint: true
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
