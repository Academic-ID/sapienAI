# sapienAI

Self-hosted academic chatbot and research assistant leveraging the latest AI
models.

## What is Sapien - just another genAI wrapper?

Yes, and no.

Sapien currently provides two main functions that make it (in our opinion) the
best AI assistant for academics, researchers and students.

### 1. Sapien Chat

sapienAI provides a chat interface similar in function to ChatGPT, Claude or
other genAI interfaces. You can converse with the AI models, upload images and
files, and more. However, Sapien's chat experience ticks a few boxes not found
in other options.

- **GPT4, o3, Claude 4, Google Gemini 2.5 Pro:** One interface to access the top
  publicly available generative AI models. You can choose which model powers a
  chat, including changing models mid-chat to take advantage of the different
  capabilities of each model.
- **Realtime audio chat:** Have a realtime conversation with SapienAI.
- **All data is stored locally on your device:** Everything fed into the app,
  including all messages (sent and received), images (uploaded and generated)
  and files, remains stored on your device. The only time data leaves the system
  is when the generative AI model is called at inference time.
- **Model hosting flexibility.** Models can be accessed directly from OpenAI,
  Anthropic or Google, or you can connect to these models through Azure, AWS or
  Google Vertex.
- **All responses backed by actual academic papers.** Reduce the risk of
  hallucination, improve model accuracy and have direct access to academic
  papers. Sapien undertakes a search for relevant academic papers for each
  response and uses these papers to inform its response to you.
- **Academic focused:** Sapien is prompted to act as a non-biased and
  highly-intelligent academic advisor. You could think of Sapien as a highly
  knowledgeable expert in all domains. The ability to provide customised
  instruction ensures Sapien is flexible and highly tailored to your needs.
  Sapien also has cross-chat memory.
- **Semantic search:** All uploaded documents are stored and semantically
  indexed, allowing you to search for content using natural language. **Bonus:**
  If you have connected your Zotero account, you can semantically search items
  stored there as well!

<div style="display: flex">
  <img width="49%" alt="AcademicID" src="https://github.com/user-attachments/assets/4a458a37-e9ab-41a5-b7cf-a43ee50061a7" />
  <img width="49%" alt="AcademicID" src="https://github.com/user-attachments/assets/d4724d22-b533-4b91-b271-0470b254e6ba" />
</div>

### 2. Research Spaces

Write your next paper with Sapien's Research Spaces. Research Spaces are
dedicated workspaces for you to upload your project documents and files. An
integrated editor allows you to write and edit documents, and the chat interface
allows you to ask questions about your documents, summarise them, and more. All
uploaded documents are summarised based on the instructions you provide and are
semantically indexed, allowing you to easily find information.

- **Streamline your writing:** Our integrated editor lets you write your next
  research paper with Sapien's assistance. Keep it simple and write using
  Markdown or other text-based formats, or leverage our integrated support for
  [Typst](https://github.com/typst/typst) for a richer writing experience.
- **Organise your research:** Keep all your notes, sources, and drafts in one
  intelligent, interconnected space. All uploaded documents can be semantically
  searched, and AI-powered literature reviews can be exported in Word and Excel
  format.
- **Enhance productivity:** Work directly within the platform, from initial idea
  to final draft.

<div style="display: flex;">
<img width="49%" alt="AcademicID" src="https://github.com/user-attachments/assets/30dd1a6c-7e78-4594-91c7-ed5ea1a5b59b" />
<img width="49%" alt="AcademicID" src="https://github.com/user-attachments/assets/1878e56e-737b-4a93-a8e3-cb402bb90e60" />
</div>

<div style="display: flex;">
<img width="49%" alt="AcademicID" src="https://github.com/user-attachments/assets/1dc39b22-88aa-4e80-a56c-81c332a9c646" />
<img width="49%" alt="AcademicID" src="https://github.com/user-attachments/assets/1a89823f-d7f9-4a99-93d0-5aade121f2a7" />
</div>

> [!IMPORTANT]
> The Editor feature (a separate feature from the Research Spaces described above) is no longer being maintained. It still works, but the functionality is being moved into Research Spaces.
> It is recommended that any new writing be started in the Research Space editor.

## Beta notice!

SapienAI is still under active development. Testing has been limited and only on
a small range of devices. As such, there are no guarantees that the service will
work flawlessly across all devices. We encourage you to raise any issues you
come across [here](https://github.com/Academic-ID/sapienAI/issues).

## Table of Contents

1.  [Quick Start](#quick-start)
2.  [General Application Settings](#general-application-settings)
    - [Serving Behind a Unique URL (e.g. a Reverse Proxy)](#serving-behind-a-unique-url-eg-a-reverse-proxy)
4.  [Database Configuration](#database-configuration)
    - [Weaviate](#weaviate)
    - [Redis](#redis)
5.  [AI Model Configuration](#ai-model-configuration)
    - [General AI Settings](#general-ai-settings)
    - [OpenAI](#openai)
    - [Azure OpenAI Service](#azure-openai-service)
    - [Anthropic Claude (Direct and AWS)](#anthropic-claude-direct-and-aws)
    - [Google Gemini & Vertex AI](#google-gemini--vertex-ai)
    - [Model-Specific Defaults (Tokens)](#model-specific-defaults-tokens)
6.  [File Storage Configuration](#file-storage-configuration)
    - [General Storage Settings](#general-storage-settings)
    - [Azure Blob Storage](#azure-blob-storage)
    - [AWS S3](#aws-s3)
    - [Google Cloud Storage (GCS)](#google-cloud-storage-gcs)
    - [S3-Compatible Storage (e.g., MinIO or Cloudflare R2)](#s3-compatible-storage-eg-minio-or-cloudflare-r2)
7.  [External Service Integrations](#external-service-integrations)
    - [PaperBuzz](#paperbuzz)
    - [Semantic Scholar](#semantic-scholar)
8. [Connecting Your Zotero Account](#connecting-your-zotero-account)
9.  [Important Notes](#important-notes)
10.  [Experimental Features](#experimental-features)

---

## Quick Start

### Requirements

To run this software, you will need `Docker` and `Docker Compose`.

The easiest way to start is to download Docker Desktop, which automatically
installs Docker Compose. Instructions to download `Docker Desktop` can be found
[here](https://www.docker.com/get-started/).

### Install

You can clone this repository or download it as a zip file (and then unzip once
downloaded).

To continue with the installation, you can open the folder in an IDE or a text
editor such as [Visual Studio Code](https://code.visualstudio.com/download), or
you can open the docker-compose.yml file with a text editor such as TextEdit on
Mac or Notepad on Windows.

### Setting the environmental variables

SapienAI has been built to be as customisable as possible. All configurable
options are outlined in the `example.env` file.

To get started, rename the `example.env` file to `.env` and fill out the
variables in that file as outlined below.

The minimum requirement is a valid `OpenAI API key` _OR_ setting up an Azure
OpenAI service connection.

Example `.env` file entry:

```env
OPENAI_KEY=your_openai_api_key_here
```

### OpenAI Key

The quickest way to get started is to set the `OPENAI_KEY` environmental
variable. This is your
[OpenAI API key](https://platform.openai.com/docs/quickstart/account-setup).

You can get your API key here by signing up (or logging in) here:
[https://platform.openai.com/settings/organization/api-keys](https://platform.openai.com/settings/organization/api-keys)

### Start SapienAI

Once you have set the OpenAI key (and any other variables), you can start the
service by running:

```
docker compose up -d
```

---

## General Application Settings

These variables control the core behaviour and environment of the application.

This does not need to be updated if using the provided Docker Compose file. If
you change the ports here, make sure you update the relevant ports in the Docker
Compose files.

| Environment Variable   | Description                                                                                                                   | Type                                     | Default Value               |
| :--------------------- | :---------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------- | :-------------------------- |
| `BACKEND_PORT`         | Port the main backend service will listen on.                                                                                 | number                                   | `3030`                      |
| `METRICS_PORT`         | Port for Prometheus metrics.                                                                                                  | number                                   | `9464`                      |
| `FRONTEND_URL`         | The base URL of the frontend application.                                                                                     | string (URL)                             | `http://localhost:3000`     |
| `BACKEND_URL`          | The base URL of this backend application.                                                                                     | string (URL)                             | `http://localhost:3030`     |
| `NUXT_PUBLIC_API_BASE` | The base API endpoint for the frontend to communicate with the backend. See the comments in example.env for more information. | string (URL)                             | `http://localhost:3030/api` |
| `NUXT_PUBLIC_WS_BASE`  | The base ws endpoint for the frontend to communicate with the backend. See the comments in example.env for more information.  | string (URL)                             | `ws://localhost:3030`       |
| `TIMEZONE`             | The timezone the application will operate in.                                                                                 | string (e.g., `UTC`, `America/New_York`) | `UTC`                       |
| `CUSTOM_PROMPT`        | A custom prompt to be used in conversation generation.                                                                        | string                                   | `null`                      |
| `ADVANCED_EXTRACTION`  | Extract text from files using the GPT4o vision capabilities (expensive but highest quality text extraction).                  | `true` or `false`                        | `false`                     |
| `MAX_WORKERS`          | Number of files that can be processed in parallel.                                                                            | number                                   | `3`                         |

### Serving Behind a Unique URL (e.g. a Reverse Proxy)

To host the service behind a reverse proxy or otherwise through a custom domain name, you will need to update the following variables: `FRONTEND_URL`, `BACKEND_URL`, `NUXT_PUBLIC_API_BASE`, and `NUXT_PUBLIC_WS_BASE`. Unfortunately, Microsoft login will not work when served on a unique URL, as the redirect address will not match what is registered in the EntraID portal. Make sure other components, such as storage, are also defined correctly with the correct URLs.

---

## Database Configuration

### Weaviate

Vector database for semantic search and RAG.

This does not need to be updated if using the provided Docker Compose file.

| Environment Variable               | Description                                         | Type   | Default Value   |
| :--------------------------------- | :-------------------------------------------------- | :----- | :-------------- |
| `WEAVIATE_HOST`                    | Hostname of the Weaviate instance.                  | string | `weaviate`      |
| `WEAVIATE_PORT`                    | Port of the Weaviate instance.                      | string | `8080`          |
| `WEAVIATE_SCHEME`                  | Connection scheme for Weaviate (`http` or `https`). | string | `http`          |
| `WEAVIATE_API_KEY`                 | API key for Weaviate authentication (if enabled).   | string | `@5D%t$3b49NWx` |
| `WEAVIATE_GRPC_HOST`               | GRPC host for Weaviate                              | string | `weaviate`      |
| `WEAVIATE_GRPC_PORT`               | Port for GRPC communication.                        | number | `50051`         |
| `WEAVIATE_REPLICAS`                | Number of replicas for Weaviate data.               | number | `1`             |
| `WEAVIATE_BACKUP_RESTORE_ID`       | ID for Weaviate backup/restore operations.          | string | `null`          |
| `WEAVIATE_BACKUP_HOURLY_FREQUENCY` | How often (in hours) to perform Weaviate backups.   | number | `24`            |

### Redis

In-memory data store.

This does not need to be updated if using the provided Docker Compose file.

| Environment Variable | Description                                              | Type                     | Default Value        |
| :------------------- | :------------------------------------------------------- | :----------------------- | :------------------- |
| `REDIS_URL`          | Comma-separated list of Redis connection URLs.           | string (comma-separated) | `redis://redis:6379` |
| `REDIS_PORT`         | Port used by Redis. Must match the port in the REDIS_URL | string                   | `6379`               |
| `REDIS_PW`           | Password for Redis authentication.                       | string                   | `596Lf6`             |

---

## AI Model Configuration

Configure access to various Large Language Models (LLMs) and AI services. **At
least one AI model provider (OpenAI, Azure OpenAI, Claude, or Gemini) must be
configured for the application to function correctly.**

### General AI Settings

| Environment Variable | Description                                     | Type            | Default Value |
| :------------------- | :---------------------------------------------- | :-------------- | :------------ |
| `VECTOR_LENGTH`      | Length of vectors from the embeddings endpoint. | `1536` or `512` | `1536`        |

### OpenAI

Uses OpenAI's official API.

| Environment Variable                    | Description                                                                  | Type   | Default Value |
| :-------------------------------------- | :--------------------------------------------------------------------------- | :----- | :------------ |
| `OPENAI_KEY`                            | Your OpenAI API key.                                                         | string | `null`        |
| `OPEN_AI_TEXT_GEN_MODEL`                | Default OpenAI model for text generation (e.g., `gpt-4o`).                   | string | `gpt-4o`      |
| `OPEN_AI_TEXT_GEN_MINI_MODEL`           | Default OpenAI model for "mini" text generation tasks (e.g., `gpt-4o-mini`). | string | `gpt-4o-mini` |
| `OPEN_AI_TEXT_GEN_REASONING_LRG_MODEL`  | OpenAI large reasoning model.                                                | string | `o1`          |
| `OPEN_AI_TEXT_GEN_REASONING_MINI_MODEL` | OpenAI mini reasoning model.                                                 | string | `o1-mini`     |

### Azure OpenAI Service

To use an `Azure OpenAI Service deployment`, you can set the following
variables. At present, due to the variable availability of different models with
different capabilities, you have to set specific deployments for different
functionalities.

There are five distinct Azure Resources that can be set (only resource one is
absolutely required):

1. The resource for text generation and embeddings. These functionalities need
   to be contained within the same resource. There will need to be a deployment
   for the `text-embedding-3-small` model, and a deployment for a GPT4 family
   model that supports 128k tokens and a deployment for a 4o-mini model.
2. A resource for a vision deployment endpoint. This must contain a vision
   capable GPT4-family model.
3. A resource for a Dall.e 3 deployment.
4. A resource for reasoning models (e.g. o1 & o1-mini).
5. A resource for a real-time chat.

These resources can overlap. If you have a resource in a region that has the
availability for all features, you can set the env variables for each feature to
the same resource (but you still have to set each env variable).

If you do not set the Azure vision resource, and no other vision-capable models
are set, you will not be able to use vision capabilities in the chat.

This is somewhat unwieldy, but until Azure provides all models in all regions,
this is the best way to maximise what can be achieved using Azure.

| Environment Variable                     | Description                                                                                      | Type    | Default Value        |
| :--------------------------------------- | :----------------------------------------------------------------------------------------------- | :------ | :------------------- |
| `USING_GPT4O`                            | Set to `false` if not using a vision-capable GPT-4o model on Azure, leave the default otherwise. | boolean | `true`               |
| `AZURE_OPENAI_API_VERSION`               | API version for Azure OpenAI services.                                                           | string  | `2024-12-01-preview` |
| **Text & Embedding Models (General)**    |                                                                                                  |         |                      |
| `AZURE_OPENAI_KEY`                       | API key for general Azure OpenAI text/embedding services.                                        | string  | `null`               |
| `AZURE_OPENAI_RESOURCE`                  | Resource name/endpoint for Azure OpenAI text/embedding.                                          | string  | `null`               |
| `AZURE_OPENAI_TXT_DEPLOYMENT`            | Deployment name for the primary Azure OpenAI text generation model.                              | string  | `null`               |
| `AZURE_OPENAI_TXT_DEPLOYMENT_MINI`       | Deployment name for the "mini" Azure OpenAI text generation model.                               | string  | `null`               |
| `AZURE_OPENAI_EMBED_DEPLOYMENT`          | Deployment name for the Azure OpenAI embedding model.                                            | string  | `null`               |
| **Vision Models**                        |                                                                                                  |         |                      |
| `AZURE_OPENAI_VISION_RESOURCE`           | Resource name/endpoint for Azure OpenAI vision models.                                           | string  | `null`               |
| `AZURE_OPENAI_VISION_DEPLOYMENT`         | Deployment name for the Azure OpenAI vision model.                                               | string  | `null`               |
| `AZURE_OPENAI_VISION_KEY`                | API key for Azure OpenAI vision services.                                                        | string  | `null`               |
| **Image Generation Models (DALL-E)**     |                                                                                                  |         |                      |
| `AZURE_OPENAI_IMG_RESOURCE`              | Resource name/endpoint for Azure OpenAI image generation.                                        | string  | `null`               |
| `AZURE_OPENAI_IMG_DEPLOYMENT`            | Deployment name for Azure OpenAI image generation.                                               | string  | `null`               |
| `AZURE_OPENAI_IMG_KEY`                   | API key for Azure OpenAI image generation.                                                       | string  | `null`               |
| **Realtime/Streaming Endpoints**         |                                                                                                  |         |                      |
| `AZURE_REALTIME_URL`                     | URL for Azure real-time (streaming) services.                                                    | string  | `null`               |
| `AZURE_REALTIME_KEY`                     | API key for Azure real-time (streaming) services.                                                | string  | `null`               |
| **Reasoning Models (e.g., "o1" series)** |                                                                                                  |         |                      |
| `AZURE_OPENAI_REASONING_KEY`             | API key for Azure OpenAI reasoning models.                                                       | string  | `null`               |
| `AZURE_OPENAI_REASONING_RESOURCE`        | Resource name/endpoint for Azure OpenAI reasoning models.                                        | string  | `null`               |
| `AZURE_OPENAI_REASONING_DEPLOYMENT`      | Deployment name for the large Azure OpenAI reasoning model.                                      | string  | `null`               |
| `AZURE_OPENAI_REASONING_MINI_DEPLOYMENT` | Deployment name for the mini Azure OpenAI reasoning model.                                       | string  | `null`               |

### Anthropic Claude (Direct and AWS)

Configure access to Anthropic's Claude models. Only one option needs to be set
to use Claude models.

| Environment Variable     | Description                                                                       | Type   | Default Value |
| :----------------------- | :-------------------------------------------------------------------------------- | :----- | :------------ |
| **Direct API**           |                                                                                   |        |               |
| `CLAUDE_MODEL`           | Claude model name (e.g., `claude-3-opus-20240229`).                               | string | `null`        |
| `CLAUDE_API_KEY`         | Your Anthropic API key.                                                           | string | `null`        |
| **AWS Bedrock (Claude)** |                                                                                   |        |               |
| `CLAUDE_AWS_MODEL`       | Claude model ID on AWS Bedrock (e.g., `anthropic.claude-3-sonnet-20240229-v1:0`). | string | `null`        |
| `CLAUDE_AWS_REGION`      | AWS region where the Bedrock model is hosted.                                     | string | `null`        |
| `CLAUDE_AWS_ACCESS_KEY`  | AWS Access Key ID for Bedrock access.                                             | string | `null`        |
| `CLAUDE_AWS_SECRET_KEY`  | AWS Secret Access Key for Bedrock access.                                         | string | `null`        |

### Google Gemini & Vertex AI

Configure access to Google's Gemini models. Only one option needs to be set to
use Gemini models.

| Environment Variable             | Description                                                         | Type   | Default Value |
| :------------------------------- | :------------------------------------------------------------------ | :----- | :------------ |
| **Direct API**                   |                                                                     |        |               |
| `GEMINI_MODEL`                   | Gemini model name (e.g., `gemini-1.5-pro-latest`).                  | string | `null`        |
| `GEMINI_API_KEY`                 | Your Google AI Studio API key for Gemini.                           | string | `null`        |
| **Vertex AI**                    |                                                                     |        |               |
| `GEMINI_MODEL`                   | Gemini model name (e.g., `gemini-1.5-pro-latest`).                  | string | `null`        |
| `VERTEX_PROJECT`                 | Google Cloud Project ID for Vertex AI.                              | string | `null`        |
| `VERTEX_LOCATION`                | Location/Region for your Vertex AI resources (e.g., `us-central1`). | string | `null`        |
| `GOOGLE_APPLICATION_CREDENTIALS` | See below                                                           | string | `null`        |

To set the `GOOGLE_APPLICATION_CREDENTIALS` with Docker and Docker Compose,
you'll need to use a volume mount.

```yaml
volumes:
  - /pathToCredentialsOnHost/credentials.json:/pathToCredentialsInContainer/credentials.json:ro
```

For example, if the json credential file is in the root directory and is called
`credentials.json`, your `.env` file would include:

```env
GOOGLE_APPLICATION_CREDENTIALS='/app/credentials.json'
```

The Docker Compose file, under the **backend** service, would have the
following:

```yml
env_file:
  - .env
volumes:
  - ./credentials.json:/app/credentials.json:ro
```

### Model-Specific Defaults (Tokens)

These settings control the default token limits for different model families.

For example GPT4.1 can support 1 million tokens so you may want to update the
`MAX_CONVERSATION_TOKEN_COUNT` variable to make use of this larger context.

| Environment Variable                     | Description                                                             | Type   | Default (Max if not set / Valid Range) |
| :--------------------------------------- | :---------------------------------------------------------------------- | :----- | :------------------------------------- |
| `MAX_OUTPUT_TOKENS`                      | Max response tokens for standard GPT-4-family models.                   | number | `16384` (<= 16384)                     |
| `MAX_CONVERSATION_TOKEN_COUNT`           | Max conversation tokens for standard GPT-4-family models. (Min `35000`) | number | `124000`                               |
| `MAX_OUTPUT_TOKENS_SMALL`                | Max response tokens for "mini" GPT-4-family models.                     | number | `16384` (<= 16384)                     |
| `MAX_CONVERSATION_TOKEN_COUNT_SMALL`     | Max conversation tokens for "mini" GPT-4-family models.                 | number | `124000`                               |
| `reasoning_lrg_openAI_max_response`      | Max response tokens for large OpenAI reasoning models.                  | number | `100000` (<= 100000)                   |
| `reasoning_lrg_openAI_max_convo_tokens`  | Max conversation tokens for large OpenAI reasoning models.              | number | `200000` (<= 200000)                   |
| `reasoning_mini_openAI_max_response`     | Max response tokens for mini OpenAI reasoning models.                   | number | `65000` (<= 65000)                     |
| `reasoning_mini_openAI_max_convo_tokens` | Max conversation tokens for mini OpenAI reasoning models.               | number | `120000` (<= 120000)                   |
| `claude_max_response_tokens`             | Max response tokens for Claude models.                                  | number | `8192` (<= 8192)                       |
| `claude_max_conversation_tokens`         | Max conversation tokens for Claude models.                              | number | `200000` (<= 200000)                   |
| `gemini_max_response_tokens`             | Max response tokens for Gemini models.                                  | number | `65000` (<= 65000)                     |
| `gemini_max_conversation_tokens`         | Max conversation tokens for Gemini models.                              | number | `1000000` (<= 1000000)                 |

---

## File Storage Configuration

Define where uploaded files and application data are stored.

The defaults here will work with no adjustments required if using the provided
Docker Compose file.

### General Storage Settings

| Environment Variable  | Description                                   | Type                                      | Default Value   |
| :-------------------- | :-------------------------------------------- | :---------------------------------------- | :-------------- |
| `FILE_CLOUD_PROVIDER` | Which cloud provider to use for file storage. | `azure`, `aws`, `google`, `s3-compatible` | `s3-compatible` |

### Azure Blob Storage

You can provide a connection string _OR_ an account name + key.

| Environment Variable              | Description                               | Type   | Default Value |
| :-------------------------------- | :---------------------------------------- | :----- | :------------ |
| `AZURE_STORAGE_CONNECTION_STRING` | Connection string for Azure Blob Storage. | string | `null`        |
| `AZURE_STORAGE_ACCOUNT_NAME`      | Azure Storage account name.               | string | `null`        |
| `AZURE_STORAGE_ACCOUNT_KEY`       | Access key for Azure Storage account.     | string | `null`        |
| `AZURE_CONTAINER_NAME`            | Name of the Azure Blob Storage container. | string | `null`        |

### AWS S3

| Environment Variable    | Description                          | Type   | Default Value |
| :---------------------- | :----------------------------------- | :----- | :------------ |
| `AWS_REGION`            | AWS region for the S3 bucket.        | string | `null`        |
| `AWS_ACCESS_KEY_ID`     | AWS Access Key ID for S3 access.     | string | `null`        |
| `AWS_SECRET_ACCESS_KEY` | AWS Secret Access Key for S3 access. | string | `null`        |
| `AWS_BUCKET_NAME`       | Name of the AWS S3 bucket.           | string | `null`        |

### Google Cloud Storage (GCS)

There are two options for Google storage. The first and simplest is to provide
Application Default Credentials. To do so, set the env var as noted under the
[Google Gemini & Vertex AI](#google-gemini--vertex-ai) configuration. Make sure
the ADC provides appropriate access to the storage. If you set the ADC, you only
need to set the `GOOGLE_BUCKET_NAME` in the list below. If not using ADC, fill
in all the variables in this table:

| Environment Variable  | Description                                 | Type   | Default Value |
| :-------------------- | :------------------------------------------ | :----- | :------------ |
| `GOOGLE_PROJECT_ID`   | Google Cloud Project ID.                    | string | `null`        |
| `GOOGLE_CLIENT_EMAIL` | Client email from GCS service account JSON. | string | `null`        |
| `GOOGLE_PRIVATE_KEY`  | Private key from GCS service account JSON.  | string | `null`        |
| `GOOGLE_BUCKET_NAME`  | Name of the Google Cloud Storage bucket.    | string | `null`        |

### S3-Compatible Storage (e.g., MinIO or Cloudflare R2)

| Environment Variable              | Description                                                                                                                                                                                                                                                | Type    | Default Value           |
| :-------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------ | :---------------------- |
| `S3_COMPATIBLE_ENDPOINT`          | Endpoint URL for the S3-compatible service (e.g., MinIO).                                                                                                                                                                                                  | string  | `http://localhost:9000` |
| `S3_COMPATIBLE_ACCESS_KEY_ID`     | Access Key ID for the S3-compatible service.                                                                                                                                                                                                               | string  | `minioadmin`            |
| `S3_COMPATIBLE_SECRET_ACCESS_KEY` | Secret Access Key for the S3-compatible service.                                                                                                                                                                                                           | string  | `minioadmin`            |
| `S3_COMPATIBLE_BUCKET_NAME`       | Bucket name in the S3-compatible service.                                                                                                                                                                                                                  | string  | `academicid`            |
| `S3_COMPATIBLE_FORCE_PATH_STYLE`  | Whether to force path-style addressing (`true` or `false`). Defaults to `true` if not set.                                                                                                                                                                 | boolean | `true`                  |
| `S3_COMPATIBLE_ENDPOINT_SERVICE`  | Service name as defined in the Docker Compose file if storage is within the same Compose project as the AcademicID services (e.g., `minio`) – this is required for communication between Docker Containers, see the example.env file for more information. | string  | `minio`                 |

---

## External Service Integrations

### PaperBuzz

| Environment Variable | Description                               | Type   | Default Value |
| :------------------- | :---------------------------------------- | :----- | :------------ |
| `PAPERBUZZ_EMAIL`    | Email address for PaperBuzz API requests. | string | `null`        |

### Semantic Scholar

| Environment Variable       | Description                   | Type   | Default Value |
| :------------------------- | :---------------------------- | :----- | :------------ |
| `SEMANTIC_SCHOLAR_API_KEY` | API key for Semantic Scholar. | string | `null`        |

---

## Connecting Your Zotero Account

To connect your Zotero account, follow these steps:

<div style="display: flex">
  <img width="49%" alt="AcademicID" src="https://github.com/user-attachments/assets/d953f4cc-ebfc-40bc-9b10-608aea402cf0" />
  <img width="49%" alt="AcademicID" src="https://github.com/user-attachments/assets/e71731f6-3a85-470f-a90d-2e1c9e875805" />
</div>

When logged into Zotero's web interface, the UserID and link to create an API key can be found [here](https://www.zotero.org/settings/security#applications).

<div style="display: flex; align-items: center">
  <img width="49%" alt="AcademicID" src="https://github.com/user-attachments/assets/72e95732-9dac-4b69-b5a5-b34c902dfd07" />
  <img width="49%" alt="AcademicID" src="https://github.com/user-attachments/assets/b48f33ba-11f9-446d-82ad-9c5942ac3aec" />
</div>

---

## Important Notes

- **Security:** Many environment variables, especially API keys are sensitive.
  Ensure they are stored securely and not hardcoded or committed to version
  control.
- **Model Availability:** The application dynamically determines available AI
  models based on the presence of their respective API keys or configurations.
  If a required key/config is missing for a model, that model will not be
  available for use.
- **Validation:** The application performs a basic validation check on startup.
  If critical environment variables are missing or improperly set (e.g., if no
  AI models can be configured), the application may fail to start. Check the
  Docker logs for details in such cases.
- **Default Values:** Many variables have default values to maximise
  performance, such as large default conversation token allowances. This can
  increase costs, so be sure to keep an eye on API spend.

## Experimental Features

We run regular builds using the 'experimental' image tag. These images contain
the latest features we are working on but will be entirely unstable.
