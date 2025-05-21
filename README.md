# Final Project Deployment Pipelines

This project uses three pipelines to deploy the infrastructure and application components.

## Pipeline Order

1. **Terraform Pipeline** – Must be deployed first.  
2. **Frontend and Backend Pipelines** – Can be deployed in any order after Terraform.

## Prerequisites

Before running the pipelines, make sure to configure the following service connections in your Azure DevOps project:

1. **Azure Resource Manager** connection to your Azure subscription.  
2. **Docker Hub** connection for use in the frontend and backend pipelines.
   - You must create **two repositories** in Docker Hub (one for the frontend and one for the backend).

## Terraform Pipeline Notes

- The Terraform pipeline is configured **not to apply automatically**.  
  Manual approval is required by the user who triggered the pipeline (or by users with permission) to prevent unintended deployments.

- After a successful run, the pipeline will output the **Ingress External IP** for accessing the application.

## Configuration Required

- Each pipeline YAML file includes comments indicating where to edit:
  - Docker image names
  - Environment variables
  - Other project-specific details

- Update the `subscription_id` in the Terraform files with your Azure subscription ID to provision resources correctly.
