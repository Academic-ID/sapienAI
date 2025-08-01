# SapienAI

SapienAI is a self-hosted academic chatbot and research workspace that provides
access to the latest models from OpenAI, Anthropic, Google and models you
self-host in one interface. Features include realtime audio chat, local data
storage, academic paper integration, semantic search, and dedicated research
spaces for writing and organizing academic work.

# Features

## Sapien Chat

SapienAI provides a chat interface similar in function to ChatGPT, Claude or
other genAI interfaces. You can converse with the AI models, upload images and
files, and more. However, Sapien's chat experience ticks a few boxes not found
in other options.

- **GPT4, o3, Claude 4, Google Gemini 2.5 Pro & Ollama:** One interface to
  access the top publicly available generative AI models or your own self-hosted
  ones! You can choose which model powers a chat, including changing models
  mid-chat to take advantage of the different capabilities of each model.
- **Realtime audio chat:** Have a realtime conversation with SapienAI.
- **All data is stored locally on your device:** Everything fed into the app,
  including all messages (sent and received), images (uploaded and generated)
  and files, remains stored on your device.
- **Model hosting flexibility.** Models can be accessed directly from OpenAI,
  Anthropic or Google, or you can connect to these models through Azure, AWS or
  Google Vertex. With Ollama support, you can also now run models locally on
  your machine, or connect to services that utilise the same Ollama API format.
- **All responses backed by actual academic papers.** Reduce the risk of
  hallucination, improve model accuracy and have direct access to academic
  papers. SapienAI can undertake a search for relevant academic papers to inform
  each response.
- **Academic focused:** SapienAI is prompted to act as a non-biased and
  highly-intelligent academic advisor. You could think of SapienAI as a highly
  knowledgeable expert in all domains. With cross-chat memory and the ability to
  provide customised instructions SapienAI is flexible and always tailored to
  your needs.
- **Semantic search:** All uploaded documents are stored and semantically
  indexed, allowing you to search for content using natural language. **Bonus:**
  If you have connected your **Zotero** account, you can semantically search
  items stored there as well!

<div style="display: flex">
  <img width="49%" alt="AcademicID" src="https://github.com/user-attachments/assets/4a458a37-e9ab-41a5-b7cf-a43ee50061a7" />
  <img width="49%" alt="AcademicID" src="https://github.com/user-attachments/assets/d4724d22-b533-4b91-b271-0470b254e6ba" />
</div>

## Research Spaces

Write your next paper with SapienAI's Research Spaces. Research Spaces are
dedicated workspaces for you to upload your project documents and files. An
integrated editor allows you to write and edit documents, and the chat interface
allows you to ask questions about your documents, summarise them, and more. All
uploaded documents are summarised based on the instructions you provide and are
semantically indexed, allowing you to easily find information.

- **Streamline your writing:** Our integrated editor lets you write with **as
  little or as much AI assistance as you desire**. Keep it simple and write
  using Markdown or other text-based formats, or leverage our integrated support
  for [Typst](https://github.com/typst/typst) and LaTex for a richer writing
  experience.
- **Organise your research:** Keep all your notes, sources, and drafts in one
  intelligent, interconnected space. All uploaded documents can be semantically
  searched, and AI-powered literature reviews can be exported in Word and Excel
  format.

<div style="display: flex;">
<img width="99%" alt="AcademicID" src="https://docs.academicid.io/imgs/image2.png" />
</div>

<div style="display: flex;">
<img width="99%" alt="AcademicID" src="https://github.com/user-attachments/assets/1a89823f-d7f9-4a99-93d0-5aade121f2a7" />
</div>

## Getting Started

The full documentation for SapienAI can be found
[here](https://docs.academicid.io/selfhosting/00-getting-started). The
documentation includes installation instructions, configuration options, and
more.

### Quick Start Guide

For those who want to get started quickly, you can run SapienAI using Docker
Compose:

```bash
git clone https://github.com/Academic-ID/sapienAI
cp example.env .env   # edit as needed, minimum requirement is setting an AI provider (e.g. setting OpenAI key is the quickest way to get started)
docker compose up -d
```

## Beta notice!

SapienAI is still under active development. Testing has been limited and only on
a small range of devices. As such, there are no guarantees that the service will
work flawlessly across all devices. We encourage you to raise any issues you
come across [here](https://github.com/Academic-ID/sapienAI/issues).
