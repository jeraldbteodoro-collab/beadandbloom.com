# Bead & Bloom — Digital Bracelet Studio

This repository is a static site you can publish via GitHub Pages.

Quick deploy (local):

1. Create a repository on GitHub.
2. From this project folder run:

```bash
git init
git add .
git commit -m "Add site"
git branch -M main
git remote add origin https://github.com/<your-username>/<repo>.git
git push -u origin main
```

3. The workflow `.github/workflows/gh-pages.yml` runs on push to `main` and will publish the repository root to the `gh-pages` branch. Your site will be available at:

```
https://<your-username>.github.io/<repo>/
```

To test locally quickly:

```bash
python -m http.server 8000
# then open http://localhost:8000/share.html?beads=...
```

If you want, I can run the helper script `push-to-github.ps1` here for you — provide the repository HTTPS URL (or let me run the git commands locally if you permit).
