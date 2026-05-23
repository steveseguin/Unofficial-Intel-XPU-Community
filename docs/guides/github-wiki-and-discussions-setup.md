# GitHub Wiki And Discussions Setup

This repo includes source files for both the repository docs and the GitHub Wiki.

## Discussions

Suggested categories:

- Announcements
- Setup Help
- Benchmarks And Results
- Guides And Patches
- Research Links
- Show And Tell
- Q&A

GitHub category forms are stored in `.github/DISCUSSION_TEMPLATE/`. The filename must match the category slug:

- `setup-help.yml`
- `benchmarks-and-results.yml`
- `guides-and-patches.yml`
- `research-links.yml`
- `show-and-tell.yml`

After creating the categories in the GitHub UI, merge these files into the default branch. GitHub will then show the matching form when someone starts a discussion in that category.

## Pinned Welcome Post

Use [`community/discussions-welcome.md`](../../community/discussions-welcome.md) as the first pinned welcome discussion.

## Wiki

The wiki source pages live in `docs/wiki/`:

- `Home.md`
- `Getting-Started.md`
- `Two-B70-Use-Cases.md`
- `Drivers-and-Runtimes.md`
- `Diagnostics.md`
- `Benchmarks-and-Results.md`
- `Docker-and-Containers.md`
- `Research-Pipeline.md`

If GitHub has already initialized the wiki repository:

```bash
git clone https://github.com/steveseguin/Unofficial-Intel-XPU-Community.wiki.git
cp docs/wiki/*.md Unofficial-Intel-XPU-Community.wiki/
cd Unofficial-Intel-XPU-Community.wiki
git add -A
git commit -m "Initialize Intel XPU community wiki"
git push
```

If `git clone` returns `Repository not found` even though the Wiki feature is enabled, create the first `Home` page once through the GitHub Wiki UI, then repeat the clone/push flow.
