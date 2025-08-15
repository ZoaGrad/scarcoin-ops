# Scarcoin Ops

This repository contains the infrastructure-as-code to run the ScarCoin stack locally using Docker Compose, or deploy it to Kubernetes using Helm.

## Local Development

### Prerequisites

- Docker and Docker Compose
- `make`
- `helm` (for Kubernetes deployment)

### Getting Started

1.  **Set up your environment variables:**

    Copy the example environment file. This file is used by `docker-compose` and other scripts.

    ```bash
    cp .env.example .env
    ```

    You may want to fill in some of the values in `.env` if you are not using the default local setup.

2.  **Start the entire stack:**

    This command will build the necessary images and start all the services in the background.

    ```bash
    make up
    ```
    The services are started in the following order: `anvil` → `deploy-contracts` → `ml-oracle` → `agentnet` → `indexer` → `wallet-ui`.

3.  **Monitor the logs:**

    To see the logs from all the running services, use:
    ```bash
    make logs
    ```

### Service URLs

Once the stack is up and running, you can access the services at the following URLs:

-   **Anvil (local blockchain):** `http://localhost:8545`
-   **ML Oracle:** `http://localhost:8000`
    -   Health: `/health`
    -   Score: `/score`
    -   Metrics: `/metrics`
    -   Public Key: `/pubkey`
-   **Indexer (GraphQL):** `http://localhost:8080`
-   **Wallet UI:** `http://localhost:5173`

### Other Commands

-   **Stop the stack:** `make down`
-   **Reset the stack (stops, removes volumes, and starts again):** `make reset`
-   **Seed demo data:** `make seed`
