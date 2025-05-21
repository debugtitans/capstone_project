Kubernetes Deployment Instructions
Prerequisites

Ensure you have kubectl installed and configured.
You can install it by following the official guide:
👉 or using the following template to Install kubectl

- task: AzureCLI@2
displayName: 'Get AKS Credentials' 
  inputs:
    azureSubscription: '<your-service-connection>'
    scriptType: 'bash'
    scriptLocation: 'inlineScript'
    inlineScript: |
      az aks get-credentials \
       --resource-group <your-resource-group> \ 
       --name <your-aks-cluster-name> \ 
       --admin
      kubectl config current-context
  displayName: 'Install and configure kubectl'


Deployment Order

    Create the Namespace
    Run the namespace.yml file first to create the required namespace:

    kubectl apply -f namespace.yml

Deploy the Frontend
Apply both the frontend deployment and service files:

    kubectl apply -f frontend_deploy.yml
    kubectl apply -f frontend_cluster_ip.yml


Set Up Ingress
Apply the Ingress to expose the frontend externally:

    kubectl apply -f frontend_ingress.yml


    Make sure all files are applied within the correct namespace.