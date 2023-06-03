# CoreOS Kiosk

The CoreOS Kiosk is a project aimed at building a Chromium kiosk running on CoreOS (specifically, a Silverblue spin). It automates the creation of a customized Fedora Silverblue image, which then runs Chromium in kiosk mode.

## How It Works

The project uses a set of scripts to customize a Fedora Silverblue image by:

1. Updating the system
2. Removing GNOME and installing Openbox
3. Installing Chromium
4. Setting up autologin for a specified user
5. Configuring Openbox to autostart Chromium in incognito mode
6. Setting Openbox as the default session

Then, it creates a QCOW2 image from the customized Silverblue VM.

Jenkins is used to orchestrate these operations, running inside a Docker container. The `jenkins_home` directory is copied into the Docker image and includes the Jenkins configuration and job definitions.

## Getting Started

To get started, you'll need to:

1. Clone this repository.
2. Run the Jenkins Docker container using the docker-compose.yml.
3. Connect to Jenkins (default port is 8080).
4. Run the Jenkins job to create the customized Silverblue image.
5. Use the resulting QCOW2 image to launch a VM.

Please note that you may need to adjust some of the scripts to suit your environment, particularly the username for the autologin configuration.

## Contributions and License

Contributions are welcome! Please note that this project is licensed under the Apache 2.0 license.
