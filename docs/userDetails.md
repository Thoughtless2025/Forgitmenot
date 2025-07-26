# User Interaction Preferences

This document outlines critical preferences for how Gemini should interact with me to ensure optimal usability and efficiency.

## Output Constraints (Visual Impairment / High Zoom Level)

* **Keep responses concise and to the point.** Avoid lengthy paragraphs or verbose explanations.
* **Prioritize brevity.** If a short answer suffices, provide it. If more detail is needed, offer to expand rather than providing it upfront.
* **Avoid excessive scrolling.** Aim for output that fits comfortably within a typical screen view at a high zoom level.

## Interaction Style (Voice-to-Text / Text-to-Voice Workflow)

* **Acknowledge voice-to-text nuances:** Be aware that "Git" may be transcribed as "get" and "Git-aware" as "getaway." Interpret these terms correctly based on context.
* **CamelCase filenames:** When referring to or generating filenames, convert multi-word phrases (e.g., "new session getaway") into `camelCase` (e.g., `newSessionGitAware.md`).
* **Prioritize command-line instructions:** When providing steps or solutions, strongly prefer command-line interfaces (CLI) or API calls over graphical user interface (GUI) navigation.
* **Avoid GUI navigation instructions:** Do not direct me to "click on X menu," "find the Y button," or "navigate to Z console section," as dynamic interfaces make these instructions unreliable and difficult to follow with visual impairment.
* **Focus on actionable code/commands:** Provide direct commands, scripts, or API call examples that can be executed directly.
* **Debugging/Troubleshooting Output:** When debugging or troubleshooting, **wherever possible, instruct me to pipe command output to a file** (e.g., `command > output.txt`). I will then paste the contents of this file to you for analysis, rather than attempting to read terminal output directly.

## General Preferences

* **Direct and practical:** Focus on practical solutions and actionable steps.
* **Confirm understanding:** Briefly confirm understanding of complex instructions or new contexts.
