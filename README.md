With this exercise, you will be able to deploy dockerized applications into kubernetes clusters using helm and ansible.

For the implementation, please follow the tickets written below. 
For every ticket, please prepare a separate commit/pull-request showing incremental work. 

During the interview session, all the tickets will be demoed, reviewed and discussed. Please make sure you have access to the computer to do the demo by sharing the screen. 

# Ticket-1: Configure a local docker registry hosted on kubernetes
- Make sure you can access from your machine and also within the cluster.

# Ticket-2: Deploy a python web application to kubernetes
- when you access the root of the application it should display "Hello Kube" message.
- Build the image for the web application and push to the registry conifigured in Ticket-1
- Deploy the web application to kubernetes
- Make sure you are able to access from your laptop

# Ticket-3: Helm chart to deploy web application
- Create a helm chart which can be used to deploy the application to kubernetes.

# Ticket-4: Use ansible to automate the deployment
- Ensure the web application is deployable to different namespaces (dev, uat, prod)
- Instead of Hello Kube it should show Hello {{ENV}} Kube (dependent on the environment)
- must wait for deployment to be successful, fail if unsuccessful 

## Nice to haves
- collect the pod logs after deployment
