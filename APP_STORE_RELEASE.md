# App Store Release Status

This file is the source of truth for the Infinite Hole iOS release. Read it
before continuing App Store work and update it after every completed step.

Last verified: 2026-09-25

## App identifiers

- App Store name: Infinite Hole: Geometry
- App Store Connect app ID: `6814536082`
- Bundle ID: `com.yunus.InfiniteHole`
- SKU: `INFINITE-HOLE-001`
- Apple Developer team ID: `8S2896PC49`
- ASC profile: `InfiniteHole-Geometry`

## Completed and verified

- [x] The game works correctly on a physical iPhone (confirmed by the owner).
- [x] Bundle ID and automatic signing are configured in the Xcode project.
- [x] The App Store Connect app record exists.
- [x] App Store version `1.0` was submitted on 2026-09-24.
- [x] Build `1.0.0 (3)` is iPhone-only (`UIDeviceFamily = [1]`), includes the
  custom icon, was processed as `VALID`, and is attached to version `1.0`.
- [x] Build encryption status is exempt.
- [x] ASC CLI `5.4.0` is installed and its API credential validates.
- [x] A custom Infinite Hole app icon was created and selected in Xcode.
- [x] The default launch placeholder was replaced with branded launch assets.
- [x] Privacy policy and support documents were prepared in the public repo.
- [x] Reproducible en-US App Store metadata was prepared under `metadata/`.
- [x] The en-US subtitle, description, keywords, privacy URL, and support URL
  were uploaded to App Store Connect.
- [x] Primary category is `Games`; subcategories are `Casual` and `Action`.
- [x] Third-party content rights are declared as not used.
- [x] Copyright is set to `2026 Yunus Oz`.
- [x] All age-rating content answers are set to none/false.
- [x] Price is Free and availability is enabled in all territories, including
  future territories.
- [x] Build `3` is declared as not using non-exempt encryption.
- [x] Two iPhone 6.5-inch screenshots were validated and uploaded; final files
  are under `screenshots/app-store/en-US/iphone65/`.
- [x] iPad support, the iPad screenshot, and the empty iPad screenshot set were
  removed. The App Store listing is iPhone-only.
- [x] App Review contact details and reviewer notes were configured. No demo
  account is required.
- [x] App Privacy is published as `DATA_NOT_COLLECTED`; the reproducible answer
  is stored in `metadata/app-privacy.json`.
- [x] The regulated medical-device declaration is recorded as false.
- [x] Deep validation reports zero blocking errors.
- [x] Version `1.0` was submitted to App Review on 2026-09-24.
- [x] Apple reviewed the submission and requested additional information under
  Guideline 2.1 on 2026-09-25 because the developer account has limited App
  Review history. Apple did not report a crash, functional defect, or metadata
  violation.

## App Store Connect resource IDs

- Version ID: `afbcbca6-3e1c-4945-8509-c6decbe7b77e`
- Attached build ID: `341d4c2a-cfdf-4604-b435-64353baec7d7`
- Previous universal build ID: `62bb520d-488c-43ad-ba9a-279250440c17`
- Previous placeholder-icon build ID: `af3776ff-01be-4f94-8be6-3aa8370ba747`
- App Info ID: `57960786-e4da-423a-be55-5efc97984db8`
- en-US version localization ID: `24970528-5969-44e4-8a7d-4f9ecb58a5a7`
- en-US app-info localization ID: `b1f0fcbc-342b-4a91-87e5-559f2ac1d961`
- iPhone screenshot set ID: `852ab412-1c4f-45b6-9642-348c9f07d872`
- Review submission ID: `dbf44218-b1cd-49bc-89bf-3f3f84c08263`
- Resolution Center thread ID: `8a48581a-4f07-3b21-9bc8-b9886ddf7e40`

## Current status

App Store Connect currently reports:

- App Store version state: `REJECTED`
- Review state: `UNRESOLVED_ISSUES`
- Build processing state: `VALID`
- Review issue count: `1`
- Next action: provide the requested screen recording and app information,
  update App Review Notes, reply in App Store Connect, and resubmit.

## Guideline 2.1 response requirements

- [ ] Record the latest build on a physical iPhone running the latest iOS. The
  recording must start with launching the app and show the normal flow: tap
  `PLAY`, drag the hole, catch several fitting shapes, reach a later level, tap
  `EXIT`, and return to the title screen.
- [ ] Attach the recording to App Review Information.
- [ ] Add the requested purpose, audience, access, services, regional behavior,
  and regulated-content answers to App Review Notes. The prepared response is
  in `metadata/app-review/guideline-2.1-response.md`.
- [ ] Reply to Apple's Resolution Center message with the same information.
- [ ] Resubmit version `1.0` for review. A new build is not currently required.

## Remaining account action

Apple's agreements page reports both developer agreements as active. It also
shows a Digital Services Act notice requiring the Account Holder to declare
trader or non-trader status for European Union distribution. This is a legal
account classification, is not currently blocking App Review, and must be
answered by the account owner in App Store Connect.

## Next execution order

1. Capture the required physical-device screen recording and place the video
   file in the workspace.
2. Upload the recording, update App Review Notes, and reply to Apple.
3. Resubmit version `1.0`, then monitor it with
   `asc status --app 6814536082`.
4. Complete the EU trader-status declaration in App Store Connect.
5. After approval, verify the release state and public App Store listing.

## ASC maintenance note

`asc auth doctor` passes with no errors. It warns that the credential is stored
in `~/.asc/config.json` while the system keychain is available. Migrating the
profile to Keychain is recommended but is not a release blocker. Never commit
the API private key or ASC credential configuration to this repository.
