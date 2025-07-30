# ForgitMeNot App: Front-End Design and User Flow

## 1. Overall App Screen Layout Principles

To ensure a consistent and intuitive user experience across all screens:

* **Consistent Header:** Every screen will feature a hamburger icon (☰) at a conventional top-corner location (top-right).
    * **Consistent Hamburger Menu Content:** Tapping this icon will *always* reveal the same side-drawer or pop-over menu. This menu will consistently list **all available primary screens** (e.g., Create File, Push/Save Confirmation, Settings) along with compliance documents (Privacy Policy, Data Use Policy, Other Compliance Documents), regardless of which screen the user is currently on.
* **Consistent Footer:** Every screen will reserve a dedicated space at the very bottom for a **static banner advert**, maintaining a fixed size to ensure consistent integration of advertising.

## 2. Create File Screen Design (Initial Launch View)

Upon opening the app, the user will be presented with this primary view.

* **Prominent Title:** A clear and prominent title at the top of the main content area, stating: **"Paste content here"**. This immediately guides the user on the primary action.

* **Content Input Area (Text Field):** This will be a dedicated, multi-line text input field.
    * It will automatically accommodate the entire contents of the clipboard when pasted, with **vertical scrolling enabled** for the user to review the full content. The box itself will **not be user-resizable** and will maintain a consistent visual footprint on the screen. The app should automatically scroll to the end of the pasted content, or allow the user to scroll to review.
    * **Crucially, this input area will feature distinct and unambiguous visual boundaries.** It will have **clear, high-contrast edges or a background that strongly differentiates it from the surrounding UI**, ensuring that even for users with partial sight, the exact tappable/input area is immediately obvious. There will be no ambiguity as to where the text should be entered or where existing text resides.
    * This input box will occupy **most of the remaining screen space** below the title, maximizing the visible area for pasted content.

* **File Selection Option:** Immediately below the main "Paste content here" text input box, there will be an alternative input method:
    * **Label:** Text prominently displayed saying: **"Or pick a file"**.
    * **Action Button:** A clearly visible **"Pick a file" button**. Tapping this button will trigger the standard file picker interface native to the operating system (e.g., Android's file picker, web browser's file upload dialog).
    * **Functionality:** This feature will allow the user to select any file type that the standard file picker can handle. The selected file's content will then be prepared for pushing to the Git repository alongside or instead of pasted text content.

* **Action Button (Bottom):** Below the large content input area (and the file selection option), there will be a single, prominent **"Continue" button**. This button will initiate the next steps in the workflow.

## 3. Push/Save Confirmation Screen Design

After the user interacts with the "Continue" button on the "Create File Screen Design," they will be presented with this second screen, adhering to the general app layout principles.

* **File Name Input Field:** A clearly labeled text input field will display the suggested file name.
    * **Default Naming Logic:**
        * **If a file was picked from the file picker:** The default file name will be the exact filename of the selected file (e.g., `my_document.pdf`, `image.jpg`).
        * **If text was pasted into the text box:** The default file name will be derived from the first part of the pasted text. This will involve:
            * Taking the first 20 characters of the text, or a concatenation of the first few words, to form a descriptive base.
            * Converting this base to **camelCase** (e.g., "my new document" becomes "myNewDocument").
            * Appending the default file extension **`.md`** (lowercase) to the end (e.g., `MyNewDocument.md`).
    * **User Overwrite:** The user will have the ability to type over and modify this suggested default file name.

* **Commit Message Input Field:** A text input field (likely multi-line for potential user expansion) will display a default Git commit message.
    * **Default Commit Message Logic:** The default message will be constructed as:
        `"[Defaulted FileName].md pushed using the ForgitMeNot app."`
        (e.g., "myNewDocument.md pushed using the ForgitMeNot app.").
    * **Purpose:** This default message serves to clearly indicate within the Git repository's history that the commit originated from an action performed within the ForgitMeNot app.
    * **User Overwrite:** The user will have the ability to type over and modify this suggested default commit message.

* **Repository/Folder Combination Selection:** A clear mechanism to select the target Git repository *and* its associated target subfolder (or root) from a list of pre-configured combinations (managed in the Settings screen).
    * **Default Selection:** The display will initially be populated with the **last used repository/folder combination**.
    * **UI Suggestion:** A **dropdown menu (or "spinner" on Android)** will present these pre-defined combinations. The currently selected combination (e.g., "RepoA/docs", "RepoB/images", "RepoC/") would be prominently displayed, and tapping it would open a list of all configured options for selection. This keeps the push screen simple and focused.

* **Local Save Location Selection:** A clear mechanism to select the target local device folder from a list of pre-configured folders (managed in the Settings screen).
    * **Default Selection:** The display will initially be populated with the **last used local save folder**.
    * **UI Suggestion:** A **dropdown menu (or "spinner" on Android)** will present these pre-defined local folder options.

* **Action Buttons (Bottom of Screen):**
    * **"Confirm & Push" Button:** A prominent button, likely labeled "Confirm & Push" (or similar), which, when tapped, will:
        * Validate the entered information (file name, commit message).
        * Execute the Git push operation to the selected repository/folder combination.
        * Initiate the local file saving process.
        * Provide user feedback (success/failure).
    * **"Go Back" Button:** A "Go Back" button, positioned clearly to allow the user to return to the previous "Create File Screen Design" without performing any Git operations or local saves.

## 4. Configuration Screen Design (Settings Screen)

The Settings screen will be accessible via the consistent hamburger menu from any primary screen in the app. It will adhere to the general app layout principles. This screen is where all essential configurations will be managed.

### 4.1. User Credentials

This section will be at the top of the Settings screen, allowing the user to configure their core Git authentication.

* **Username Input Field:** A clearly labeled text input field for the user's Git username. This is included for clarity, even if not strictly required by the PAT for authentication.
* **Personal Access Token (PAT) Input Field:** A **clear, visible text input field** for the user's Git Personal Access Token. **Characters entered into this field will be fully visible and NOT masked (e.g., with asterisks)**, allowing the user to easily verify their input.
    * **Guidance Note:** Directly underneath this input field, a brief, highly visible note will state: "You need a PAT because Git no longer lets you use your password for direct app access, so please be careful."
    * **Link to Instructions:** A clear, tappable link will direct the user to the app's internal or external extensive instructions on "Why you need a PAT and how to get one (with full permissions)."
* **PAT Scope:** It is understood that a single PAT, configured with appropriate permissions, will be used across all Git repositories the user wishes to access via the app.
* **"Authenticate" Button:** A dedicated button (e.g., "Test Authentication" or "Authenticate") will be present in this section. Tapping this button will attempt to verify the entered username and PAT with the Git hosting service. This provides immediate feedback on the correctness of credentials before proceeding to other sections.

### 4.2. Git Repository & Folder Combinations Management

This section will follow the User Credentials and will leverage successful authentication.

* **Dynamic Repository and Folder Listing:** Once authentication is successful (via the "Authenticate" button above), this section will display a dynamically fetched list of Git repositories and their associated folders that the configured PAT grants access to. This list will be presented in a clear, browsable manner (e.g., "repo-name/folder-path").
* **Configuration of Usable Combinations via Checkbox:** Against each dynamically listed repository/folder combination, there will be a **tick box (checkbox)**.
    * **Ticked State:** A ticked checkbox indicates that this specific repository/folder combination is **active** and will appear in the dropdown list on the main "Push/Save Confirmation Screen Design" for selection.
    * **Unticked State:** An unticked checkbox effectively **removes this Git repository/folder combination from the user's configured list entirely.** There is no "inactive" status; it's either on the list or it's not.
    * **User Management:** Users can simply tick or untick the box to add or remove a combination from their usable list. This entirely replaces separate "Add" or "Delete" buttons for individual combinations, simplifying the interface significantly. **Editing an existing combination directly will not be permitted.** To modify a combination, the user must delete it by unticking, and then re-select and re-add the desired new combination from the fetched list.

### 4.3. Local File Save Locations Management

This section will follow the Git Repository & Folder Management.

* **List of Configured Local Save Locations:** A clear list will display all local folder paths that the user has configured for saving.
* **Adding New Local Save Locations:**
    * A prominent **"Add Local Folder" button** (or similar label) will be present.
    * Tapping this button will trigger the **standard operating system's folder picker/browser**. The user can then navigate to and select an *existing* folder on their device.
    * Once selected, this folder path will be added to the list of configured local save locations.
* **Managing Configured Local Save Locations via Checkbox:** Against each listed local folder path, there will be a **tick box (checkbox)**.
    * **Ticked State:** A ticked checkbox indicates that this local folder path is currently part of the user's configured list and will appear in the dropdown list on the main "Push/Save Confirmation Screen Design" for selection.
    * **Unticked State:** An unticked checkbox effectively **removes this local folder path from the user's configured list entirely.** There is no "inactive" status; it's either on the list or it's not. This provides a straightforward binary management of the configured paths.

---

