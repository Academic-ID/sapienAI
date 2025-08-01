# SapienAI

<p align="center">
  <!-- Optional: If you have a logo, uncomment the line below -->
  <img src="https://docs.academicid.io/logo.svg" alt="SapienAI Logo" width="150"/>
  <h1 align="center">SapienAI</h1>
  <p align="center">
    Your Self-Hosted, All-in-One AI Research Workspace
    <br />
    <a href="https://docs.academicid.io/selfhosting/00-getting-started"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/Academic-ID/sapienAI/issues">Report Bug</a>
    ·
    <a href="https://github.com/Academic-ID/sapienAI/issues">Request Feature</a>
  </p>
</p>

<!-- Badges -->
<p align="center">
    <a href="https://github.com/Academic-ID/sapienAI/stargazers">
        <img src="https://img.shields.io/github/stars/Academic-ID/sapienAI?style=social" alt="GitHub Stars">
    </a>        
</p>

SapienAI is a self-hosted academic chatbot and research workspace. It unifies
the latest models from **OpenAI, Anthropic, Google, and self-hosted Ollama
models** into a single, secure interface. Features include realtime audio chat,
100% local data storage, academic paper integration, semantic search, and
dedicated research spaces for writing and organizing your work.

---

### ❤️ Support The Project

**If you find SapienAI useful, please consider giving it a star ⭐ on GitHub and
sharing it with your colleagues!** Your support helps the project grow and
motivates further development.

---

## 🌟 Key Features

### 💬 Unified Chat Interface

Converse with the world's best AI models in one place.

- **🧠 Multi-Provider Support:** Seamlessly switch between the top models from
  OpenAI, Anthropic and Google, and local models via Ollama.
- **🎙️ Realtime Audio Chat:** Have a natural, spoken conversation with the AI.
- **🔒 100% Local & Private:** All messages, files, and images are stored
  securely on your own device.
- **🔌 Flexible Hosting:** Connect directly to APIs (OpenAI, Anthropic, Google)
  or through services like Azure, AWS, and Google Vertex.
- **📚 Academic Grounding:** Reduce hallucinations by backing every response
  with real academic papers from its integrated search.
- **🔍 Semantic Search:** Instantly find information across all your chats and
  uploaded documents using natural language. Connect your **Zotero** library to
  search it too!

<div style="display: flex; justify-content: space-between;">    
<img src="https://github.com/user-attachments/assets/4a458a37-e9ab-41a5-b7cf-a43ee50061a7" alt="Chat Interface" width="49%" />
<img src="https://github.com/user-attachments/assets/d4724d22-b533-4b91-b271-0470b254e6ba" alt="Audio Chat Interface" width="49%" />
</div>

### 🔬 Research Spaces

A dedicated workspace to streamline your entire academic writing process.

- **✍️ Integrated Editor:** Write your paper with as little or as much AI
  assistance as you need. Full support for **Markdown**, **Typst** and
  **LaTeX**.
- **📂 Unified Document Management:** Upload your project documents, notes, and
  sources. The AI can read, summarize, and answer questions about them.
- **📊 AI-Powered Literature Reviews:** Automatically generate and export
  literature reviews in Word or Excel format based on your uploaded sources.

<img src="https://docs.academicid.io/imgs/image2.png" alt="Research Space Overview" width="100%" />
<img src="https://github.com/user-attachments/assets/1a89823f-d7f9-4a99-93d0-5aade121f2a7" alt="Integrated Editor" width="100%" />

## 🚀 Getting Started

Get your own instance of SapienAI running in minutes.

### Prerequisites

- [Docker](https://www.docker.com/get-started) &
  [Docker Compose](https://docs.docker.com/compose/install/) (comes with Docker
  Desktop)

### Quick Start Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/Academic-ID/sapienAI.git
    cd sapienAI
    ```

2.  **Configure your environment:** Copy the example environment file and edit
    it with your details.

    ```bash
    cp example.env .env
    ```

    At a minimum, you must set an API key for at least one AI provider (e.g.,
    `OPENAI_API_KEY`).

3.  **Run with Docker Compose:**
    ```bash
    docker compose up -d
    ```

SapienAI will now be running at `http://localhost:3000`. For detailed
configuration options, please see the
[**full documentation**](https://docs.academicid.io/selfhosting/00-getting-started).

## ⚠️ Beta Notice

SapienAI is under active development and is currently in a beta phase. While we
are working hard to ensure stability, you may encounter bugs. We greatly
appreciate your help in making it better!

Please **[open an issue](https://github.com/Academic-ID/sapienAI/issues)** to
report any problems you face.
