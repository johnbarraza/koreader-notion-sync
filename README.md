# NotionSync for KOReader

**NotionSync** is a powerful plugin for **KOReader** that automatically synchronizes your book highlights and notes directly to a **Notion database**. It transforms your reading data into organized, actionable knowledge by creating a dedicated page for each book and populating it with your annotations.

---

## ✨ Features

- 📚 **Automatic Page Management**  
  Creates a new page in your Notion database for every book you sync. If the page already exists, it intelligently updates it.

- 🔄 **Smart Syncing**  
  Only uploads new or modified highlights. It keeps track of the last sync time to avoid duplicates.

- 📝 **Rich Formatting**  
  Highlights are formatted as bullet points, including your personal notes, page numbers, and chapter information.

- ⚡ **One-Click Sync**  
  Integrated directly into the KOReader **Tools** menu for quick access. Supports gesture triggers (e.g., tap corner to sync).

- ⚙️ **Easy Configuration**  
  Built-in settings menu to configure your Notion Token and select your target database directly on your e-reader.

---

## 🚀 Installation

### 1. Download the Plugin
Download the latest `notionsync.koplugin.zip` from the **Releases** page  
(or clone this repository).

### 2. Transfer to Device
1. Connect your KOReader device (Kindle, Kobo, Android, etc.) to your computer via USB.
2. Navigate to the following directory on your device:
```

koreader/plugins/

```
3. Extract the downloaded zip file here.  
You should end up with a folder named:
```

notionsync.koplugin

```

### 3. Restart KOReader
Eject your device and restart KOReader to load the new plugin.

---

## 🛠️ Notion Setup

Before using the plugin, you need to set up a dedicated database in Notion and get an API token.

### 1. Create a Notion Integration
1. Go to **Notion → My Integrations**.
2. Click **+ New integration**.
3. Name it (e.g., `KOReader Sync`).
4. Select the associated workspace.
5. Click **Submit**.
6. Copy the **Internal Integration Secret** (starts with `ntn_...`).  
You will need this later.

### 2. Create the Database
1. In Notion, create a new page.
2. Add a **Table view database** (or use an existing one).

#### Required Properties
Make sure your database includes the following properties:

| Property Name | Type  | Description |
|--------------|-------|-------------|
| **Name**     | Title | Book title |
| **Last Sync**| Date  | Required. Used to track the last update |

> Optional: You may add other properties such as **Author** (Text), but the plugin primarily writes to the page content.

### 3. Connect the Integration
1. Open your database page.
2. Click the **three dots (⋯)** in the top-right corner.
3. Scroll to **Connect to** / **Add connections**.
4. Select the `KOReader Sync` integration you created earlier.

> ⚠️ **Important:** If you skip this step, the plugin will not be able to find your database.

---

## ⚙️ Plugin Configuration

Configure the plugin directly on your device.

1. Open **KOReader**.
2. Go to the **Tools** menu (screwdriver / wrench icon).
3. Tap **NotionSync Settings**.

### Set Notion Token
1. Tap **Set Notion Token**.
2. Enter your `ntn_...` key from Notion.
3. Tap **Save**.

### Select Database
1. Ensure **Wi-Fi is ON**.
2. Tap **Select Database**.
3. Choose your target database from the fetched list.

---

## 📖 Usage

### Manual Sync
1. Open a book in KOReader.
2. Open the **Tools** menu.
3. Tap **Sync to Notion**.
4. A popup will show sync progress (e.g., *“Syncing highlights…”*).
5. On success, you’ll see a message like:
```

Success! New: 5, Updated: 0

```

### Gesture Sync (Optional)
Assign syncing to a gesture for instant access.

1. Go to **Settings (⚙️)** → **Taps and gestures** → **Gesture manager**.
2. Select a trigger (e.g., **Tap corner → Top-right**).
3. Choose **Sync to Notion** from the action list.

Now, simply tap that corner to sync your current book 📲

---

## ❓ Troubleshooting

- **“No databases found”**  
Ensure you connected your integration to the database using **Connect to** in Notion.

- **“Connection Error”**  
Check that Wi-Fi is enabled and your device has internet access.

- **“Sync Failed”**  
Inspect the `crash.log` file in your KOReader folder for detailed error messages.

---

## 📄 License

This project is licensed under the **MIT License**.

---

**Happy Reading & Syncing! 📚✨**
