# sapienAI

Self-hosted academic chatbot and writing assistant leveraging the latest AI
models, including GPT4, o1, Claude Models and Gemini

## What is Sapien - just another genAI wrapper?

Yes, and no.

Sapien currently provides two main functions that make it (in our opinion) the
superior AI assistant for academics, researchers and students.

### 1. Sapien Chat

sapienAI provides a chat interface similar in function to ChatGPT, Claude or
other genAI interfaces. Similar to other genAI chat interfaces, you can converse
with the AI models, upload images for vision functionality and files, and have
Sapien generate images. However, Sapien's chat experience ticks a few boxes that
you may find appealing compared to other options.

- **GPT4, o1, Claude Models, Google Gemini:** One interface to access the top
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
  Sapien also has cross-chat memory. When you provide custom instructions, as
  you converse with Sapien, it can update these instructions to provide the best
  ongoing assistant experience possible.

### 2. AI-Powered Academic Writing Engine

Write your next academic paper or essay using the power of AI. Use the built-in
text editor or connect your Microsoft account to continue writing in Word.
Sapien provides feedback on each paragraph to improve your academic writing.

Sapien is instructed not to tell you what to write or how to write it but
instead to challenge your assumptions, ensuring your arguments are robust and
well-formed.

The writing assistant also provides direct access to relevant academic papers,
academic experts (through ExpertID), and items in your Zotero library through
the Zotero integration.

**This feature is being depreciated to be replaced by a better AI-writing
experience early in 2025**

### 3. Research Spaces

Research spaces allow you to upload documents and have the AI provide summaries
and a literature review. You can then semantically search over these documents
to find relevant documents and chunks within documents.

### 4. Zotero Semantic Search

Connect your Zotero account and semantically search over your items.

## Beta notice!

SapienAI is still under active development. Testing has been limited and only on
a small range of devices. As such, there are no guarantees that the service will
work flawlessly across all devices. We encourage you to raise issues with us if
you come across any to help us speed up our work towards releasing more stable
versions.

## Getting started

For those familiar with running Docker images with Docker Compose, this should
be a straightforward experience. If you are unfamiliar with running Docker
images, these instructions are hopefully detailed enough to get you started.

### Requirements

To run this software, you will need `Docker` and `Docker Compose`.

The easiest way to start is to download Docker Desktop, which automatically
installs Docker Compose. Instructions to download `Docker Desktop` can be found
[here](https://www.docker.com/get-started/).

This software utilises [`Weaviate`](https://weaviate.io/) and
[`Redis`](https://redis.io/), both of which will automatically be set up as part
of the Docker Compose file. If you have an existing instance of either, you may
be able to leverage it by configuring the environmental variables as per the
instructions below under `Further customisation`.

The service also requires a storage service (since version 0.1.5). The Docker
Compose example here includes the Minio service as a locally hosted option. If
you do not want to use Minio remove the `minio` and `minio_mc` services from the
Docker Compose file.

### Install

> [!TIP]
> Never installed a Docker container before? Read on and then follow along with these instructions here: [https://youtu.be/77eGeTD5ufU](https://youtu.be/77eGeTD5ufU)

You can clone this repository or download it as a zip file (and then unzip once
downloaded).

To continue with the installation, you can open the folder in an IDE or a rich
text editor such as
[Visual Studio Code](https://code.visualstudio.com/download), or you can open
the docker-compose.yml file with a text editor such as TextEdit on Mac
or Notepad on Windows.

### Setting the environmental variables

SapienAI has been built to be as customisable as possible. All configurable
options are outlined in the `example.env` file.

To get started, rename the `example.env` file to `.env` and fill out the
variables in that file as outlined below.

The only requirement that you must provide is either an `OpenAI API key` or set
up the `Azure OpenAI Service deployment` configuration and then a storage
service provider.

Where the below denotes a default or the .env file has a default value noted,
these only need to be set if you want to set a value other than the default.

#### OpenAI Key

The quickest way to get started is to set the `OPENAI_KEY` environmental value.
This is your
[OpenAI API key](https://platform.openai.com/docs/quickstart/account-setup).

You can get your API key here by signing up (or logging in) here: [https://platform.openai.com/settings/organization/api-keys](https://platform.openai.com/settings/organization/api-keys)

---

#### Azure OpenAI Service

To instead use an `Azure OpenAI Service deployment`, you can set the following
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
4. A resource for an o1 & o1-mini deployment.
5. A resource for a realtime chat.

These resources can overlap. If you have a resource in a region that has the
availability for all features, you can set the env var for each feature to the
same resource (but you still have to set each env var).

If you do not set the Azure vision resource, and no other vision capable models
are set, you will not be able to use vision capabilities in the chat.

This is somewhat unwiedly, but until Azure provides all models in all regions,
this is the best way to maximise what can be achieved using Azure.

**Note:** o1 models in Azure currently do not support streaming, meaning chat
responses will only be returned after the entire response is generated (opposed
to chunks being returned as they are generated).

| Env Var                          | Description                                                                                                                                          | Example                                                                                                    |
| -------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| AZURE_OPENAI_API_VERSION         | This is the API version that will be used across all different deployments set below.                                                                | 2024-02-15-preview                                                                                         |
| AZURE_OPENAI_KEY                 | This is the API key associated with the resource used for text generation (so the key from the resource set as the `AZURE_OPENAI_RESOURCE` variable) | someStringValue                                                                                            |
| AZURE_OPENAI_RESOURCE            | This is the name of the resource containing the text generation and embed deployments.                                                               | sapien-txt-gen                                                                                             |
| AZURE_OPENAI_TXT_DEPLOYMENT      | This is the name of the deployment for a GPT-4-turbo model.                                                                                          | gpt4o                                                                                                      |
| AZURE_OPENAI_TXT_DEPLOYMENT_MINI | This is the name of the deployment for a GPT40 Mini model model.                                                                                     | gpt-4o-mini                                                                                                |
| AZURE_OPENAI_EMBED_DEPLOYMENT    | This is the name of the deployment for a `text-embedding-3-small` model.                                                                             | embeddings                                                                                                 |
| AZURE_OPENAI_VISION_RESOURCE     | This is the name of the resource containing the vision-enabled GPT4 deployment.                                                                      | sapien-vision                                                                                              |
| AZURE_OPENAI_VISION_DEPLOYMENT   | This is the name of the vision model deployment.                                                                                                     | vision                                                                                                     |
| AZURE_OPENAI_VISION_KEY          | The API key for the resource set as the `AZURE_OPENAI_VISION_RESOURCE`                                                                               | someStringValue                                                                                            |
| AZURE_OPENAI_IMG_RESOURCE        | This is the name of the resource containing the Dalle3 deployment.                                                                                   | sapien-img-gen                                                                                             |
| AZURE_OPENAI_IMG_KEY             | The API key for the resource set as the `AZURE_OPENAI_IMG_RESOURCE`                                                                                  | someStringValue                                                                                            |
| AZURE_OPENAI_IMG_DEPLOYMENT      | This is the name of the Dalle3 model deployment                                                                                                      | dalle3                                                                                                     |
| USING_GPT4O                      | This needs to be set to 'true' if using an Azure GPT4o model                                                                                         | true                                                                                                       |
| AZURE_REALTIME_URL               | The full URL pointing to your realtime API deployment.                                                                                               | wss://low-latency.openai.azure.com/openai/realtime?api-version=2024-10-01-preview&deployment=gpt4oRealtime |
| AZURE_REALTIME_KEY               | This is the name of the vision model deployment.                                                                                                     | someStringValue                                                                                            |
| AZURE_OPENAI_O1_KEY              | The API key for the resource set as the `AZURE_OPENAI_O1_RESOURCE`                                                                                   | someStringValue                                                                                            |
| AZURE_OPENAI_O1_RESOURCE         | This is the name of the resource containing the o1 deployments.                                                                                      | sapien-o1                                                                                                  |
| AZURE_OPENAI_O1_DEPLOYMENT       | The o1 model deployment.                                                                                                                             | o1-preview                                                                                                 |
| AZURE_OPENAI_O1_MINI_DEPLOYMENT  | The o1-mini model deployment.                                                                                                                        | o1-mini                                                                                                    |

---

#### Storage

Sapien supports uploading files in the chat and in research spaces. To store
these files, a storage provider needs to be available.

The app can use Azure Storage, Google Cloud Storage, Amazon S3 Storage or some
other S3-compatible storage (e.g. Cloudflare R2).

If using the default Docker Compose file with Minio the default values below can
be used (meaning the variables in the .env file under **FILE STORAGE** can be
left commented out).

| Env Var             | Description                                                                  | Example       |
| ------------------- | ---------------------------------------------------------------------------- | ------------- |
| FILE_CLOUD_PROVIDER | Has to match one of the following: `azure`, `aws`, `google`, `s3-compatible` | s3-compatible |

##### Azure

| Env Var                    | Description                       | Example         |
| -------------------------- | --------------------------------- | --------------- |
| AZURE_STORAGE_ACCOUNT_NAME | The storage account name.         | academicidfilez |
| AZURE_CONTAINER_NAME       | The container name for the files. | filez           |
| AZURE_STORAGE_ACCOUNT_KEY  | The storage account key.          | someString      |

##### AWS

| Env Var               | Description                                       | Example         |
| --------------------- | ------------------------------------------------- | --------------- |
| AWS_REGION            | The region of the storage.                        | ap-southeast-1  |
| AWS_ACCESS_KEY_ID     | The access key of an account with storage access. | someString      |
| AWS_SECRET_ACCESS_KEY | The account's secret key.                         | someString      |
| AWS_BUCKET_NAME       | The name of the storage bucket.                   | academicidfilez |

##### Google

There are two options for Google storage. The first and most simple is to
provide Application Default Credentials. To do so, set the env var as noted
under the Vertex AI Gemini configuration below. Make sure the ADC provides
appropriate access to the storage. If you set the ADC, you only need to set the
`GOOGLE_BUCKET_NAME` in the list below. If not using ADC, fill in all the env
vars in this table:

| Env Var             | Description                           | Example                                          |
| ------------------- | ------------------------------------- | ------------------------------------------------ |
| GOOGLE_PROJECT_ID   | The project ID containing storage.    | myStorageProject                                 |
| GOOGLE_CLIENT_EMAIL | The client email with storage access. | storage@myStorageProject.iam.gserviceaccount.com |
| GOOGLE_PRIVATE_KEY  | The secret account key.               | someString                                       |
| GOOGLE_BUCKET_NAME  | The name of the storage bucket.       | academicidfilez                                  |

##### s3-compatible

This storage solution has been tested with Cloudflare R2 but theoretically any
other s3-compatible should work.

| Env Var                         | Description                                                                                              | Example                                                          |
| ------------------------------- | -------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| S3_COMPATIBLE_ENDPOINT          | The endpoint of the service.                                                                             | https://897ytvugbhjns897gu.r2.cloudflarestorage.com/your-storage |
| S3_COMPATIBLE_ACCESS_KEY_ID     | The access key ID.                                                                                       | someString                                                       |
| S3_COMPATIBLE_SECRET_ACCESS_KEY | The secret access key.                                                                                   | someString                                                       |
| S3_COMPATIBLE_BUCKET_NAME       | The name of the storage bucket.                                                                          | academicidfilez                                                  |
| S3_COMPATIBLE_FORCE_PATH_STYLE  | If using path style urls, set this value to 'true'.                                                      | true                                                             |
| S3_COMPATIBLE_ENDPOINT_SERVICE  | This is only for s3 services hosted using the same Docker Compose file - see .env file for more details. | minio                                                            |

---

#### Other common Env variables

Providing the below details will open up additional functionality. For example,
providing the Google Gemini and/or Claude model config will allow you to choose
these models to power conversations.

---

##### Google Gemini

To have the option to use Google's `Gemini` models to power chat conversations,
you can provide access through either Google AI Studio _OR_ Vertex AI.

###### Google AI Studio

| Env Var        | Description                                                                                                                 | Example               |
| -------------- | --------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| GEMINI_MODEL   | The Gemini model you want to use. This must support at least 128k tokens. Vision will only work with vision capable models. | gemini-1.5-pro-latest |
| GEMINI_API_KEY | This is your API key from [Google AI Studio](https://aistudio.google.com/).                                                 | someStringValue       |

###### Google Vertex

| Env Var                        | Description                                                                                                                 | Example                                            |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------- |
| GEMINI_MODEL                   | The Gemini model you want to use. This must support at least 128k tokens. Vision will only work with vision capable models. | gemini-1.5-pro-latest                              |
| VERTEX_PROJECT                 | The Vertex AI project.                                                                                                      | myVertexProject                                    |
| VERTEX_LOCATION                | The location of your project.                                                                                               | australia-southeast1                               |
| GOOGLE_APPLICATION_CREDENTIALS | This is the file path to your                                                                                               | /path/to/credentials/in/container/credentials.json |

To set the GOOGLE_APPLICATION_CREDENTIALS with Docker and Docker Compose, you'll
need to use a volume mount.

```yaml
volumes:
  - /path/to/credentials/on/host/credentials.json:/path/to/credentials/in/container/credentials.json:ro
```

For example, if the json credential file is in the root directory and is called
`credentials.json`, your `.env` file would include:

```env
GOOGLE_APPLICATION_CREDENTIALS='/app/credentials.json'
```

The Docker Compose file, under the backend service, would have the following:

```yml
env_file:
  - .env
volumes:
  - ./credentials.json:/app/credentials.json:ro
```

---

##### Anthropic Claude

To add Anthropic's `Claude` models, you can provide the following variables.

| Env Var        | Description                                                                                                     | Example                |
| -------------- | --------------------------------------------------------------------------------------------------------------- | ---------------------- |
| CLAUDE_MODEL   | The Claude model you want to use. This must be a Claude 3 model (Haiku, Sonnet or Opus).                        | claude-3-opus-20240229 |
| CLAUDE_API_KEY | This is your API key from [Anthropic](https://docs.anthropic.com/claude/reference/getting-started-with-the-api) | someStringValue        |

---

##### AWS Anthropic Claude

You can access Anthropic's `Claude` models through Amazon Bedrock. To do so,
provide the following environmental variables.

| Env Var               | Description                                                                                        | Example                                 |
| --------------------- | -------------------------------------------------------------------------------------------------- | --------------------------------------- |
| CLAUDE_AWS_MODEL      | The Claude model being access through AWS (model naming is different than direct Anthropic access) | anthropic.claude-3-sonnet-20240229-v1:0 |
| CLAUDE_AWS_REGION     | The AWS region the model is deployed in.                                                           | ap-southeast-2                          |
| CLAUDE_AWS_ACCESS_KEY | The AWS access key for the account with authorisation to access the model deployment.              | someStringValue                         |
| CLAUDE_AWS_SECRET_KEY | The AWS secret key associated with the access key account.                                         | someStringValue                         |

The service will default to the direct Anthropic API if provided, so to use
AWS-hosted Claude, make sure you do not set the `CLAUDE_MODEL` and
`CLAUDE_API_KEY` variables.

The ability to use Claude models hosted in VertexAI is on the roadmap.

---

##### Semantic Scholar Key

Sapien uses Semantic Scholar to fetch academic papers to inform feedback or chat
messages. You can provide a
[Semantic Scholar API key](https://www.semanticscholar.org/product/api) to
remove the rate limit restrictions enforced on the public API.

| Env Var                  | Description                                  | Example         |
| ------------------------ | -------------------------------------------- | --------------- |
| SEMANTIC_SCHOLAR_API_KEY | API Key provided to you by Semantic Scholar. | someStringValue |

---

##### Paperbuzz

We augement papers returned from Semantic Scholar with data from other public
API endpoints. One of these is [Paperbuzz](https://paperbuzz.org/).

To have this additional data from the
[Paperbuzz API](https://paperbuzz.org/api), an email is required.

| Env Var         | Description                                             | Example                |
| --------------- | ------------------------------------------------------- | ---------------------- |
| PAPERBUZZ_EMAIL | An email that is provided alongside calls to Paperbuzz. | bill@emailprovider.com |

---

##### Vector Length

**! IMPORTANT:** Once this is set, it cannot be changed without wiping the
database.

This value sets the length of the embeddings vectors that are stored in the
database. As vectors are stored in memory, the size of the vectors will impact
the
[memory usage](https://weaviate.io/developers/weaviate/concepts/resources#which-factors-drive-memory-usage)
of the application. If you are hosting on a low spec machine, to avoid running
out of memory, setting the vector length to 512 may be preferrable.

| Env Var       | Description                                                                              | Example |
| ------------- | ---------------------------------------------------------------------------------------- | ------- |
| VECTOR_LENGTH | The length of the vector embeddings. Options are `512` or `1536`. The default is `1536`. | 512     |

---

##### Response Length

This value sets the max token vectors of a chat response. This can be any number
less than 16,384. If set higher than what is capable of the models being used,
the response may be cut off. o1 and o1-mini models have their own separately
configurable max token count.

You can reduce this value to reduce token usage if the max value is not
available.

| Env Var                     | Description                                                                            | Example |
| --------------------------- | -------------------------------------------------------------------------------------- | ------- |
| MAX_OUTPUT_TOKENS           | The maximum number of tokens a model will be allowed to output. The default is `16384` | 4096    |
| O1_MAX_RESPONSE_TOKENS      | The maximum number of tokens a model will be allowed to output. The default is `32768` | 16384   |
| O1_MINI_MAX_RESPONSE_TOKENS | The maximum number of tokens a model will be allowed to output. The default is `65000` | 32768   |

---

##### Max Conversation Length

The most intense use of tokens comes when conversations grow in length. To
reduce overall token usage, you can set the maximum token count of a
conversation. This results in conversations longer than this number being
summarised before being sent to the model. The summary is generated with the
less-expensive 4o-mini model with full context meaning, in theory, the summary
should include any pertinent information from older conversation messages.

| Env Var                      | Description                                                                                                                   | Example |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ------- |
| MAX_CONVERSATION_TOKEN_COUNT | The maximum number of tokens sent to the model when generating a response. The default is `124000`. The value must be > 35000 | 75000   |

---

##### Parallel Text Extraction

To speed up the Research Space's ability to handle large volumes of documents,
documents can be processed in parallel. The main restraint to doing this is the
token throughput available to you and your computer's available resources.

| Env Var     | Description                                                                                                                   | Example |
| ----------- | ----------------------------------------------------------------------------------------------------------------------------- | ------- |
| MAX_WORKERS | The maximum number of tokens sent to the model when generating a response. The default is `124000`. The value must be > 35000 | 75000   |

---

##### Advanced Extraction

Only set this if you want to extract text from files using the GPT4o vision
capabilities; this results in better text extraction and performance in semantic
search and RAG, however, it is far more expensive.

| Env Var             | Description                                                                                                                   | Example |
| ------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ------- |
| ADVANCED_EXTRACTION | The maximum number of tokens sent to the model when generating a response. The default is `124000`. The value must be > 35000 | 75000   |

---

A full list of other customisable components can be found below under heading
`Further customisation`.

**Once you have set these environment variables, make sure the file is saved as
with the file name: `.env`.**

#### Backups

You can set up Weaviate with
[backup modules](https://weaviate.io/developers/weaviate/configuration/backups)
and the app will trigger the database to backup every 24 hours.

Follow the instructions above to set up Weaviate with backups.

Each backup will have a unique ID in the form of `<DATE>-sapien-backup`. You can
find these IDs in the logs, or they should be the name of the backup items in
the location you have set the backups to.

To restore a backup, simply stop the service and set the environment variable:
`WEAVIATE_BACKUP_RESTORE_ID` with the backup ID. For example:

```yaml
WEAVIATE_BACKUP_RESTORE_ID: '2024-05-05t23_12_44-sapien-backup'
```

To prevent accidentally restoring if the system restarts and this env var is
still set, this will only restore the backup if the database is empty. This
means you may have to delete (or move elsewhere) the `weaviate_data` folder in
the `weaviate` directory before restoring the backup.

```
sapienAI/
└── weaviate/
    └── weaviate_data/
```

### Starting the service

Ensure you have `Docker Desktop` running.

Open a terminal and navigate to the folder containing the `docker-compose.yml`
file (help here:
[mac](https://www.macworld.com/article/221277/command-line-navigating-files-folders-mac-terminal.html)/[windows](https://www.lifewire.com/change-directories-in-command-prompt-5185508#:~:text=In%20the%20command%20prompt%20window%2C%20type%20cd%20followed%20by%20the,the%20one%20you%27re%20in.&text=If%20you%20want%20to%20go,back%20to%20the%20original%20option.)).

In the terminal, run the following command:

```
docker compose up -d
```

After pulling some images, this should start the services. You should be able to
open the `Docker Desktop` app and see the service running.

Open a browser and navigate to:

```
http://localhost:3000
```

You should see the app's sign-in page.

You are all set up. Enjoy!

## Signing in with your Microsoft account

Signing in with your Microsoft account allows you to utilise Sapien's academic
writing assistance without leaving Microsoft Word. It only works for Word
documents saved in Onedrive that you can access. It also requires that you are
either using a personal Microsoft account or that your administrator has
approved the SapienAI app. If you try to log in with your Microsoft account, you
will be presented with a message stating whether or not your account is eligible
to log into this service. It may also prompt you to request permission from your
system administrator to access the service.

If you have set this service up behind a reverse proxy or otherwise behind a
URL, you may struggle to sign in with Microsoft due to a mismatch between the
redirect URL and how you are running your service.

## Issues

Any issues or bugs can be raised here:
https://github.com/Academic-ID/sapienAI/issues

## Feedback

Any feedback, or other discussion can be left here:
https://github.com/Academic-ID/sapienAI/discussions

## Roadmap

We are currently working on an improved academic writing experience, including
[Typst](https://typst.app/) support and real-time collaboration on documents.

We are also working on improvements to the Research Spaces, including chatting
over documents and better tagging/coding of documents and segments.

If you have feature requests, please detail these here:
https://github.com/Academic-ID/sapienAI/discussions

We are also working towards releasing a managed cloud version, allowing users to
sign up and utilise Sapien's capabilities without self-hosting the software.

## Licence information

sapienAI is currently provided under a non-commercial use licence.

## Further customisation

Below is a list of additional environmental variables that can be set.

| Environment Variable               | Description                                                                                                                                                                                                                                                                                                               |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `BACKEND_PORT`                     | Port number for the backend server. Defaults to 3030 if not specified.                                                                                                                                                                                                                                                    |
| `FRONTEND_URL`                     | URL for the frontend application. Defaults to `http://localhost:3000`.                                                                                                                                                                                                                                                    |
| `BACKEND_URL`                      | URL for the backend application. Defaults to `http://localhost:3030`.                                                                                                                                                                                                                                                     |
| `TIMEZONE`                         | Timezone used for logging time stamps. E.g. `Australia/Sydney`. Defaults to `UTC`                                                                                                                                                                                                                                         |
| `CUSTOM_PROMPT`                    | You can provide a custom prompt to better tailor Sapien's behaviour to your desired usecase. See release note 0.05 for more details. This may impact the intended performance of the chatbot, including thinking and other behaviour. It is advisable to first test setting the `Description Prompt` on the account page. |
| `WEAVIATE_HOST`                    | Host address for the Weaviate service. Defaults to `weaviate:8080`.                                                                                                                                                                                                                                                       |
| `WEAVIATE_PORT`                    | Port for Weaviate HTTP requests. Defaults to `8080`.                                                                                                                                                                                                                                                                      |
| `WEAVIATE_GRPC_HOST`               | Host address for Weaviate GRPC requests. Defaults to `weaviate`.                                                                                                                                                                                                                                                          |
| `WEAVIATE_GRPC_PORT`               | Port for Weaviate GRPC requests. Defaults to `50051`.                                                                                                                                                                                                                                                                     |
| `WEAVIATE_SCHEME`                  | Scheme for the Weaviate service (e.g., `http`, `https`). Defaults to `http`.                                                                                                                                                                                                                                              |
| `WEAVIATE_API_KEY`                 | API key for the Weaviate service.                                                                                                                                                                                                                                                                                         |
| `WEAVIATE_BACKUP_RESTORE_ID`       | ID for Weaviate backup and restore operations.                                                                                                                                                                                                                                                                            |
| `WEAVIATE_BACKUP_HOURLY_FREQUENCY` | How frequent, in hours, Weaviate DB backups should run; default is 24 hours.                                                                                                                                                                                                                                              |
| `REDIS_URL`                        | URL for the Redis server. Defaults to `redis://redis:6379`.                                                                                                                                                                                                                                                               |
| `REDIS_PW`                         | Password for the Redis server.                                                                                                                                                                                                                                                                                            |
