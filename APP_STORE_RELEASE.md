# App Store Release Status

This file is the source of truth for the Infinite Hole iOS release. Read it
before continuing App Store work and update it after every completed step.

Last verified: 2026-09-24

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
- [x] App Store version `1.0` exists in `PREPARE_FOR_SUBMISSION` state.
- [x] Build `1.0.0 (2)` with the custom icon was uploaded, processed as
  `VALID`, and attached to App Store version `1.0`.
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
- [x] Build `2` is declared as not using non-exempt encryption.
- [x] Two iPhone 6.5-inch and one iPad Pro 12.9-inch screenshots were validated
  and uploaded; final files are under `screenshots/app-store/en-US/`.

## App Store Connect resource IDs

- Version ID: `afbcbca6-3e1c-4945-8509-c6decbe7b77e`
- Attached build ID: `62bb520d-488c-43ad-ba9a-279250440c17`
- Previous placeholder-icon build ID: `af3776ff-01be-4f94-8be6-3aa8370ba747`
- App Info ID: `57960786-e4da-423a-be55-5efc97984db8`
- en-US version localization ID: `24970528-5969-44e4-8a7d-4f9ecb58a5a7`
- en-US app-info localization ID: `b1f0fcbc-342b-4a91-87e5-559f2ac1d961`
- iPhone screenshot set ID: `852ab412-1c4f-45b6-9642-348c9f07d872`
- iPad screenshot set ID: `0f3133c1-baa4-40bb-a06a-e13eaa977402`

## Current blockers

The latest standard validation reports one blocking error, no warnings, and
one informational item:

- [ ] Add App Review contact details. Planned values: Yunus Oz,
  `ozyunus@msn.com`; the required phone number is still needed.
- [ ] Authenticate an ASC web session, publish the no-data-collected App Privacy
  declaration, and verify agreements and web-only declarations with deep
  validation. `asc web auth status` currently reports no cached session.
- [ ] Run final validation and submit for review.

## Next execution order

1. Run `asc web auth login --apple-id <APPLE_ID>` interactively in a local
   terminal; do not send the Apple password or 2FA code through chat.
2. Pull, plan, apply, and publish the no-data-collected App Privacy declaration.
3. Add review contact information after the phone number is supplied.
4. Run `asc validate --deep`, resolve remaining web-only declarations, and
   submit version `1.0` for review.

## ASC maintenance note

`asc auth doctor` passes with no errors. It warns that the credential is stored
in `~/.asc/config.json` while the system keychain is available. Migrating the
profile to Keychain is recommended but is not a release blocker. Never commit
the API private key or ASC credential configuration to this repository.
