# Tablet Display Dashboard

Always on todo list dashboard for tablet in kiosk mode. Made with OpenCode and Codex.
A companion android app is avialable at https://github.com/archisman-panigrahi/dashboard-android.

## Setup
1. Fork this github repo.
2. Edit `tasks.json` ([see below](#task-format)) and push this repository to GitHub.
3. In the repository settings, go to **Settings > Pages**.
4. Under **Build and deployment**, set **Source** to `Deploy from a branch`.
5. Select `main` branch and `/ (root)`, then click **Save**.
6. Access the deployed site at `https://<username>.github.io/<repository-name>/`. Example: https://archisman-panigrahi.github.io/dashboard/

**Note**: The site will auto-refresh in the device where you view it. To update entries, just edit `tasks.json` and push to GitHub.

## Local Preview
Opening `index.html` directly from your file manager will not work: browsers block `fetch()` requests to local `file://` URLs, so the task list stays empty. Serve the folder over HTTP instead:

```bash
./serve-locally.sh
```

Then open <http://localhost:8000>. To use a different port, pass it as the first argument, for example `./serve-locally.sh 8080`.

## How do I display this in a tablet/phone in kiosk mode?
- Open the GitHub Pages URL in a Kiosk Browser ([Play Store](https://play.google.com/store/apps/details?id=com.nktnet.webview_kiosk), [F-Droid](https://f-droid.org/en/packages/uk.nktnet.webviewkiosk/)) on the tablet.
- Enable fullscreen mode and screen keep-alive while on power.
- Use the sun/moon button in the header to switch between light and dark mode. The choice is saved on the device.
- Use the `A−` / `A+` buttons in the header to make the text smaller or larger. The chosen text size is saved on the device.
- On wider screens the task list automatically flows into multiple columns to reduce scrolling. Larger text sizes use fewer columns so the layout stays readable.
- Use **Cards** / **List** in the header to switch views. List mode uses spacious rows in up to three columns on wider screens, falling back to one column on smaller screens or with larger text. Click or tap a row to expand its timing and notes, and click again to collapse it. Keyboard users can use Tab and Enter or Space. Your view choice is saved on the device, and expanded rows stay open during automatic refreshes.

## Task Format

Each entry in `tasks.json` can be a plain string or an object with details:

```json
{
  "text": "Review research manuscript draft",
  "expected": "2h",
  "start": "09:00",
  "finish": "11:00",
  "notes": "Optional notes shown below the task."
}
```

- `text` — task name (required).
- `expected` — estimated time to finish, as free-form text such as `"45m"`, `"2h"`, or `"1h 30m"`. A number is treated as minutes.
- `start` / `finish` — planned time window. Use `"HH:MM"` for a time today, or an ISO date-time string for a specific date.
- `notes` — optional free-form notes; line breaks are preserved.

All fields except `text` are optional, and plain-string entries still work. Run `./update-tasks.sh` to edit, validate, and push changes.
