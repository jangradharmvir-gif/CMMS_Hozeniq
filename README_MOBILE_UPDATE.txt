HOZENIQ CMMS - Mobile responsive update

This update keeps the existing production CMMS HTML and adds a mobile drawer navigation and responsive sizing rules. It does NOT replace the app with the demo-only mobile preview.

In GitHub Codespaces, extract this ZIP in the repository root, then run:
  bash APPLY_HOZENIQ_MOBILE_UPDATE.sh

The script backs up the current app/src/main/assets/index.html, replaces it with the supplied responsive index, and commits/pushes the change to main. GitHub Actions should then build a new APK.

Note: this is a first responsive integration pass. Validate each module on an actual phone before production rollout.
