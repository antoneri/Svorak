#!/bin/bash
# Bygger Svorak.pkg fran src/.
# Anvandning: ./build.sh
# Resultat:   build/Svorak.pkg

set -euo pipefail

cd "$(dirname "$0")"

VERSION="${VERSION:-2.0}"
IDENTIFIER="com.apple.keyboardlayout.svorak.Install.pkg"
BUNDLE_NAME="Svorak.bundle"
INSTALL_LOCATION="/Library/Keyboard Layouts"
BUILD_DIR="build"
STAGE_DIR="${BUILD_DIR}/stage"
OUTPUT="${BUILD_DIR}/Svorak.pkg"

rm -rf "${BUILD_DIR}"
mkdir -p "${STAGE_DIR}/${BUNDLE_NAME}/Contents"

cp src/Info.plist "${STAGE_DIR}/${BUNDLE_NAME}/Contents/Info.plist"
cp -R src/Resources "${STAGE_DIR}/${BUNDLE_NAME}/Contents/Resources"

find "${STAGE_DIR}" -name .DS_Store -delete
xattr -rc "${STAGE_DIR}"

pkgbuild \
  --identifier "${IDENTIFIER}" \
  --version "${VERSION}" \
  --install-location "${INSTALL_LOCATION}" \
  --root "${STAGE_DIR}" \
  "${OUTPUT}"

echo
echo "Byggd: ${OUTPUT}"
echo "Installera: open ${OUTPUT}    (eller: sudo installer -pkg ${OUTPUT} -target /)"
