{ lib
, stdenv
, fetchurl
, pkg-config
, gnome
, gtk4
, wrapGAppsHook4
, librsvg
, gsound
, gettext
, itstool
, vala
, libxml2
, libgee
, libgnome-games-support_2_0
, meson
, ninja
, desktop-file-utils
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "gnome-nibbles";
  version = "4.0.2";

  src = fetchurl {
    url = "mirror://gnome/sources/gnome-nibbles/${lib.versions.majorMinor finalAttrs.version}/gnome-nibbles-${finalAttrs.version}.tar.xz";
    sha256 = "SF+Mnq03/xr/ANXFfZk40PXc/xyocDHyKkrjhS6HU8U=";
  };

  nativeBuildInputs = [
    meson
    ninja
    vala
    pkg-config
    wrapGAppsHook4
    gettext
    itstool
    libxml2
    desktop-file-utils
  ];

  buildInputs = [
    gtk4
    librsvg
    gsound
    libgee
    libgnome-games-support_2_0
  ];

  passthru = {
    updateScript = gnome.updateScript {
      packageName = "gnome-nibbles";
      attrPath = "gnome.gnome-nibbles";
    };
  };

  meta = with lib; {
    description = "Guide a worm around a maze";
    mainProgram = "gnome-nibbles";
    homepage = "https://wiki.gnome.org/Apps/Nibbles";
    license = licenses.gpl2Plus;
    maintainers = teams.gnome.members;
    platforms = platforms.linux;
  };
})
