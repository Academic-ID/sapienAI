# sapienAI

Self-hosted academic chatbot and writing assistant leveraging the latest AI
models, including GPT4, Claude Opus and Gemini Pro

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

1. **GPT4, Claude Models, Google Gemini:** One interface to access all three of
   the top publicly available generative AI models. You can choose which model
   powers a chat, including changing models mid-chat to take advantage of the
   different capabilities of each model.
2. **All data is stored locally on your device:** Everything fed into the app,
   including all messages (sent and received), images (uploaded and generated)
   and files, remains stored on your device. The only time data leaves the
   system is when the generative AI model is called at inference time.
3. **You set the generative AI model endpoints.** If you have requirements that
   data remains within a specific geographic region, you can set Sapien up to
   use Azure OpenAI service resources in your desired region. Similar
   customisation for AWS and VertexAI is available.
4. **All responses backed by actual academic papers.** Reduce the risk of
   hallucination, improve model accuracy and have direct access to academic
   papers. Sapien undertakes a search for relevant academic papers for each
   response and uses these papers to inform its response to you.
5. **Academic focused:** Sapien is prompted to act as a non-biased and
   highly-intelligent academic advisor. You could think of Sapien as a highly
   knowledgeable expert in all domains. The ability to provide customised
   instruction ensures Sapien is flexible and highly tailored to your needs.
   Sapien also has cross-chat memory. When you provide custom instructions, as
   you converse with Sapien, it can update these instructions to provide the
   best ongoing assistant experience possible.
6. **A very nice chat experience:** While we may be biased on this front as we
   built it how we wanted, Sapien's chat interface is clutter-free, offers
   night/day mode and is optimised for both web and mobile. Sapien works best
   when installed as a web app on your device (e.g.
   [Chrome](https://support.google.com/chrome/answer/9658361?hl=en&co=GENIE.Platform%3DDesktop)/[Edge](https://support.microsoft.com/en-au/topic/install-manage-or-uninstall-apps-in-microsoft-edge-0c156575-a94a-45e4-a54f-3a84846f6113)/[iPhone](https://www.macrumors.com/how-to/use-web-apps-iphone-ipad/)).

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

## Beta notice!

SapienAI is still under active development. Testing has been limited and only on
a restricted range of devices. As such, there are no guarantees that the service
will work across all devices. We encourage you to raise issues with us if you
come across any to help us speed up our work towards releasing a stable version.

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

### Install

You can clone this repository or download it as a zip file (and then unzip once
downloaded).

To continue with the installation, you can open the folder in an IDE or a rich
text editor such as
[Visual Studio Code](https://code.visualstudio.com/download), or you can open
the docker-compose.yml file with a text editor such as TextEdit on Mac
or Notepad on Windows.

### Setting the environmental variables

SapienAI has been built to be as customisable as possible. An outline of the
full set of values you can customise can be found in the table under the
`Further customisation` section below.

These environmental variables are to be set in the `docker-compose.yml` file
under the `environment` section of the `academicid` service.

The `docker-compose.yml` file has commented out the common env variables noted
below. To set the variables, remove the # before the variable and provide the
value after the colon. For example:

```yml
AZURE_OPENAI_IMG_RESOURCE: acid-vision
```

The only requirement that you must provide is either an `OpenAI API key` or set
up the `Azure OpenAI Service deployment` configuration.

#### OpenAI Key

The quickest way to get started is to set the `OPENAI_KEY` environmental value.
This is your
[OpenAI API key](https://platform.openai.com/docs/quickstart/account-setup).

Once this is set, and if you do not want to provide any other functionality, you
are good to skip the rest of the instructions for setting the environmental
variables and move on to starting the service.

If you want to set the specific model version, you can set the
`OPEN_AI_TEXT_GEN_MODEL` env variable. Otherwise, it will default to
`gpt-4-turbo`. If set, this must be a recent model that handles vision and tool
calling.

---

#### Azure OpenAI Service

To instead use an `Azure OpenAI Service deployment`, you can set the following
variables. At present, due to the variable availability of different models with
different capabilities, you have to set specific deployments for different
functionalities.

There are three distinct Azure Resources that need to be set:

1. The resource for text generation and embeddings. These functionalities need
   to be contained within the same resource. There will need to be a deployment
   for the `text-embedding-3-small` model, and a deployment for a GPT4 family
   model that supports 128k tokens and a deployment for a 3.5 family model.
2. A resource for a vision deployment endpoint. This must contain a GPT4-vision
   deployment.
3. A resource for a Dall.e 3 deployment. This must have a Dall.e 3 deployment.

These resources can overlap. If you have a resource in a region that has the
availability for all features, you can set the env var for each feature to the
same resource (but you still have to set each env var).

If you do not set the Azure vision resource, and no other vision capable models
are set, you will not be able to use vision capabilities.

This is somewhat unwiedly, but until Azure provides all models in all regions,
this is the way.

To simplify deployments, we are moving to only support GPT4o models. As we clean
this up, we will streamline the environmental variables that need to be set,
however for now, you must set all the variables below, even if the vision and
txt deployments are the same resources.

| Env Var                          | Description                                                                                                                                          | Example            |
| -------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------ |
| AZURE_OPENAI_API_VERSION         | This is the API version that will be used across all different deployments set below.                                                                | 2024-02-15-preview |
| AZURE_OPENAI_KEY                 | This is the API key associated with the resource used for text generation (so the key from the resource set as the `AZURE_OPENAI_RESOURCE` variable) | someStringValue    |
| AZURE_OPENAI_RESOURCE            | This is the name of the resource containing the text generation and embed deployments.                                                               | sapien-txt-gen     |
| AZURE_OPENAI_TXT_DEPLOYMENT      | This is the name of the deployment for a GPT-4-turbo model.                                                                                          | gpt4o              |
| AZURE_OPENAI_TXT_DEPLOYMENT_MINI | This is the name of the deployment for a GPT40 Mini model model.                                                                                     | gpt-4o-mini        |
| AZURE_OPENAI_EMBED_DEPLOYMENT    | This is the name of the deployment for a `text-embedding-3-small` model.                                                                             | embeddings         |
| AZURE_OPENAI_VISION_RESOURCE     | This is the name of the resource containing the vision-enabled GPT4 deployment.                                                                      | sapien-vision      |
| AZURE_OPENAI_VISION_DEPLOYMENT   | This is the name of the vision model deployment.                                                                                                     | vision             |
| AZURE_OPENAI_VISION_KEY          | The API key for the resource set as the `AZURE_OPENAI_VISION_RESOURCE`                                                                               | someStringValue    |
| AZURE_OPENAI_IMG_RESOURCE        | This is the name of the resource containing the Dalle3 deployment.                                                                                   | sapien-img-gen     |
| AZURE_OPENAI_IMG_KEY             | The API key for the resource set as the `AZURE_OPENAI_IMG_RESOURCE`                                                                                  | someStringValue    |
| AZURE_OPENAI_IMG_DEPLOYMENT      | This is the name of the Dalle3 model deployment                                                                                                      | dalle3             |
| USING_GPT4O                      | This needs to be set to 'true' if using an Azure GPT4o model                                                                                         | true               |

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
`credentials.json`, your compose file would include:

```yaml
services:
  academicid:
      ...
      environment:
         ...
         GOOGLE_APPLICATION_CREDENTIALS: '/app/credentials.json'
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

A full list of other customisable components can be found below under heading
`Further customisation`.

**Once you have set these environment variables, make sure you save the
`docker-compose.yml` file.**

#### Files

Sapien supports uploading files. These files are used within chat as well as
providing a semantic search experience over your files. Files are uploaded in
the chat interface and can then be accessed throughout the app with the library
panel.

There is no additional setup required to start using files, however, there are
different options as to how files are stored.

With version 0.1, files are handled by a seperate service as defined by the
default docker compose file. This service is designed specifically to handle
files and is required if you want access to file services in the app.

By default, uploaded files are stored locally. The default compose file has a
volume mount for where these files are stored:

```yaml
---
volumes:
  - ./files:/app/files
```

If files are deleted in the files directory, the content will remain in the
database, but you will not be able to retrieve the file iteself (deleting the
file within the app interface will remove both the stored data in the databased
and the stored original file).

If you prefer to store files in cloud storage, you can choose between one of the
following options. To allow cloud storage, first set the `FILE_CLOUD_PROVIDER`
env var and then provide the services required variables.

| Env Var             | Description                                                                  | Example |
| ------------------- | ---------------------------------------------------------------------------- | ------- |
| FILE_CLOUD_PROVIDER | Has to match one of the following: `azure`, `aws`, `google`, `s3-compatible` | azure   |

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
under the Vertex AI Gemini configuration above. Make sure the ADC provides
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

| Env Var                         | Description                     | Example                                                          |
| ------------------------------- | ------------------------------- | ---------------------------------------------------------------- |
| S3_COMPATIBLE_ENDPOINT          | The endpoint of the service.    | https://897ytvugbhjns897gu.r2.cloudflarestorage.com/your-storage |
| S3_COMPATIBLE_ACCESS_KEY_ID     | The access key ID.              | someString                                                       |
| S3_COMPATIBLE_SECRET_ACCESS_KEY | The secret access key.          | someString                                                       |
| S3_COMPATIBLE_BUCKET_NAME       | The name of the storage bucket. | academicidfilez                                                  |

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

After pulling some images, this should start the academicid, Weaviate and Redis
services. You should be able to open the `Docker Desktop` app and see the
service running.

Open a browser and navigate to:

```
http://localhost:3000
```

You should see the app's sign-in page.

You are all set up. Enjoy!

## Signing in with your Microsoft account

Signing in with your Microsoft account allows you to utilise Sapien's academic
writing assistance without leaving the Word app. It only works for Word
documents saved in Onedrive that you can access. It also requires that you are
either using a personal Microsoft account or that your administrator has
approved the sapienAI app. If you try to log in with your Microsoft account, you
will be presented with a message stating whether or not your account is eligible
to log into this service. It may also prompt you to request permission from your
system administrator to access the service.

If you have set this service up behind a reverse proxy or otherwise behind a
URL, you may struggle to sign in with Microsoft due to a mismatch between the
redirect URL and how you are running your service.

If you are a system administrator and want to set up sapienAI within your
Microsoft tenant, you can customise the environmental variables to provide the
necessary information to both the backend and frontend services. The
instructions are included in the section
`Using Microsoft Auth within your Tenant`.

## Issues

Any issues or bugs can be raised here:
https://github.com/Academic-ID/sapienAI/issues

## Feedback

Any feedback, or other discussion can be left here:
https://github.com/Academic-ID/sapienAI/discussions

## Roadmap

Our next significant feature is the `Omniscia Library`. The Omnisia Library is
both a library and an AI-powered research space. It will allow users to upload
files, such as full-text papers, and have Sapien undertake tasks such as
literature reviews and data analysis. It will also provide a unified place to
work on specific research projects, tying together AI research capabilities,
AI-assisted writing and advanced AI document processing.

While this major feature is under construction, bug fixes and small improvements
will be undertaken. On the immediate radar are expanded cloud support and more
streamlined Azure OpenAI Service configuration.

If you have feature requests, please detail these here:
https://github.com/Academic-ID/sapienAI/discussions

We are also working towards releasing a managed cloud version, allowing users to
sign up and utilise Sapien's capabilities without self-hosting the software.

## Licence information

sapienAI is currently provided under a non-commercial use licence. This is due
to code dependencies that currently restrict commercial use. We may update this
licence to a less restrictive licence in future releases as this template code
is replaced.

## Further customisation

Below is a list of additional environmental variables that can be set.

| Environment Variable               | Description                                                                                                                                                                                                                                                                                                               |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `BACKEND_PORT`                     | Port number for the backend server. Defaults to 3030 if not specified.                                                                                                                                                                                                                                                    |
| `FRONTEND_URL`                     | URL for the frontend application. Defaults to `http://localhost:3000`.                                                                                                                                                                                                                                                    |
| `BACKEND_URL`                      | URL for the backend application. Defaults to `http://localhost`.                                                                                                                                                                                                                                                          |
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
| `COLLECTOR_ENDPOINT`               | The endpoint for an Open Telemetry compatible collector. This can be used to view metrics generated by the app through a stack such as Prometheus + Grafana.                                                                                                                                                              |

## Using Microsoft Auth within your Tenant

Stay tuned. We will be adding these details here soon.

Or, reach out to info@academicid.net for quicker assistance with this.
