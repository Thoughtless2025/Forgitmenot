# ForgitMeNot App: Project Overview and Purpose

## 1. Core Purpose

The ForgitMeNot app is designed as a crucial **bridge tool** in the user's workflow for managing and transferring conversational **context** between various AI instances or agents. Its primary goal is to enable a form of **"emulated statefulness" for AI conversations** by leveraging a **Git repository as the authoritative "source of truth"** for a chat's context. This eliminates the need to repeatedly describe previous discussions to new AI agents.

## 2. Problem Addressed

The ForgitMeNot app specifically addresses a critical gap in AI interaction and Git workflows:

* **Varying AI Git Capabilities:** While some AI instances may possess the ability to read or even write directly to Git repositories, others (such as current Gemini on Android) significantly lack direct Git integration, particularly for writing/pushing content. This creates a fragmented ecosystem where a Git repository's utility as a central context source is hampered.
* **Clunky Existing Git Clients for Pushing:** Even when using separate Git client applications on Android (and other platforms), the process of preparing, adding, committing, and pushing *new versions* of a file is often cumbersome and involves multiple, "manky" steps that are not user-friendly for simple context transfer. This is exacerbated by Git's move away from traditional username/password authentication for non-web access, making Personal Access Tokens (PATs) the *only practical method* for programmatic interaction from an Android app.

The ForgitMeNot app streamlines this by providing a simplified interface specifically focused on making the *pushing of new context* to a Git repository quick and effortless. It aims to **bridge the gap** between AIs that can leverage Git as a source of truth and those that require assistance in contributing context to it, thus making the Git-as-source-of-truth strategy viable across a wider range of AI tools.

## 3. Key Functionality (Simplified Git Client)

The app functions as a highly simplified Git client, abstracting away the complexities of standard Git operations (`git add`, `git commit`, `git push`) from the user.

The intended workflow is as follows:

* **Step 1: Context Capture:** The user copies Markdown-formatted conversational **context** (e.g., a project overview, a summary of a previous chat, etc.) from an AI application (e.g., Gemini).
* **Step 2: Simple Input:** The user pastes this Markdown content into a very simple file creation interface within the ForgitMeNot app.
* **Step 3: Automated Push & Local Save:** Upon a user action within the app, the ForgitMeNot app automatically:
    * Pushes this Markdown content to a designated Git repository. This Git repository then becomes the centralized, canonical "source of truth" for that specific piece of context.
    * Writes a local file on the device for immediate access or backup.

## 4. Essential Technical Requirements & Features

These features are not planned enhancements but are **central and indispensable** for the app's core functionality:

* **Git Personal Access Token (PAT) Management:**
    * The app requires a Git Personal Access Token to authenticate with the Git repository for all push operations. This is a necessity because modern Git platforms have deprecated traditional username/password authentication for API and non-web access.
    * **In-App Guidance for PAT Acquisition:** Recognizing that obtaining a PAT can be an annoying and non-intuitive process for many users, the app will feature **extensive, clearly visible explanations** within its interface. This guidance will cover:
        * **Why a PAT is needed:** Explaining the shift in Git authentication methods.
        * **How to obtain a PAT:** A step-by-step guide tailored for common Git hosting services (e.g., GitHub, GitLab).
        * **Required Permissions:** Clear instructions on which permissions to grant (e.g., opting for full repository access for simplicity, acknowledging the user's preference over overly granular, complex options often deemed unnecessary for this app's purpose).
* **User Settings Interface:** A dedicated settings page will be paramount. This interface will allow the user to configure essential parameters such as:
    * The Git repository URL.
    * Storage and management of the Personal Access Token.
    * Potentially, default file naming conventions for saved contexts.
* **Repository and Folder Combination Management:** The Settings page will provide robust functionality for the user to define and manage multiple "repository/folder combinations." For each combination, the user can specify a Git repository URL and an optional subfolder path within that repository (e.g., `/docs`, `/images`, or `/` for the root). This setup centralizes the complexity of folder management within the settings, keeping the primary workflow streamlined.
* **Strict Folder Management Policy:** The app **will not provide functionality for users to create new Git repository folders or new local device folders** from within the app itself. Users are expected to utilize other, specialized tools for folder creation and management, ensuring the ForgitMeNot app remains focused on its core simplified Git push and local save functionality.
* **Multi-platform (Flutter):** Being a Flutter app, it aims to provide this crucial functionality consistently across various platforms, initially focusing on web debugging, but with the goal of supporting mobile platforms like Android where direct Git integration and seamless push capabilities are currently limited.

## 5. Naming Convention: "ForgitMeNot"

The name "ForgitMeNot" directly reflects the app's purpose: to prevent the "forgetting" or loss of conversational **context**, ensuring that AI agents can "remember" past interactions by sourcing information from a centralized Git repository.
