# UniLibrary

A Flutter web-ready university library student sign in app.

## Run locally

1. Install the Flutter SDK and enable web support.
2. From this project directory, fetch the dependencies:

   ```sh
   flutter pub get
   ```

3. Run the app in a browser:

   ```sh
   flutter run -d chrome
   ```

## Create a release website

Build the optimized web app:

```sh
flutter build web --release
```

Upload the contents of `build/web` to a static hosting service such as Netlify Drop, GitHub Pages, Firebase Hosting, or Vercel. For GitHub Pages hosted below a repository path, configure the Flutter build's base href for that path.

## Submission ZIP

Zip the `lib` folder for submission. On Windows PowerShell, run this from the project directory:

```powershell
Compress-Archive -Path lib -DestinationPath unilibrary-lib.zip -Force
```

On macOS or Linux, use `zip -r unilibrary-lib.zip lib` from the project directory.

The app title is currently `UniLibrary - <Your Roll No>` in `lib/main.dart`; replace the placeholder with your roll number before submitting if required.
