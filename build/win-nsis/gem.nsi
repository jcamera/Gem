; TODO
; - check whether Pd is installed
;  this is where Pd stores it's settings:
;   HKEY_LOCAL_MACHINE\SOFTWARE\Pd
;  this is the uninstaller-information of Pd-extended
;   HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\pd_is1   InstallLocation

; - ask to set env-variables
;      GEM_SINGLE_CONTEXT    /* ??? */
;      GEM_RECTANGLE_TEXTURE /* unneeded since glew? */
;      GEM_NO_TABLET         /* unneeded as [gemtablet] was dropped */
;      GEM_DEFAULT_FONT      /* "$INSTDIR/examples/data/vera.ttf" */
;  system-envvars:
;   HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
;  user-envvars:
;   HKEY_CURRENT_USER\Environment

; Script generated by the HM NIS Edit Script Wizard.
; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Gem"
!ifndef PRODUCT_VERSION
 !define PRODUCT_VERSION "0.93"
!endif
!define PRODUCT_ARCH "-W32-i686"
!define PRODUCT_PUBLISHER "iem et al."
!define PRODUCT_WEB_SITE "http://gem.iem.at"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

OutFile "gem-${PRODUCT_VERSION}${PRODUCT_ARCH}.exe"

!define BASE_INDIR "..\.."
!define BUILD_INDIR "..\win-vs2003"


; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "..\..\GnuGPL.LICENSE.txt"
; Components page
!insertmacro MUI_PAGE_COMPONENTS
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"

InstallDir "$PROGRAMFILES\pd\extra\Gem"
ShowInstDetails show
ShowUnInstDetails show

Var /GLOBAL GEM_OUTDIR
Var /GLOBAL GEMDEV_OUTDIR
Var /GLOBAL EXTRA_OUTDIR

; the sections for the library itself (binary+abstractions)

SectionGroup "Gem" SEC_Gem
 Section "Gem-binary" SEC_GemBinary
StrCpy $EXTRA_OUTDIR "$INSTDIR\.."
StrCpy $GEM_OUTDIR "$INSTDIR"
StrCpy $GEMDEV_OUTDIR "$GEM_OUTDIR\dev"


  SetOverwrite ifnewer
  SectionIn RO
  SetOutPath "$GEM_OUTDIR"
  File "${BUILD_INDIR}\Gem.dll"

  File "${BASE_INDIR}\GnuGPL.LICENSE.txt"
  File "${BASE_INDIR}\COPYING.txt"
  File "${BASE_INDIR}\ChangeLog"
  File "${BASE_INDIR}\README.txt"
 SectionEnd
 Section "Gem-abstractions" SEC_GemAbs
  SectionIn RO
  SetOverwrite ifnewer
  SetOutPath "$GEM_OUTDIR"
  File "${BASE_INDIR}\abstractions\*.pd"
 SectionEnd
SectionGroupEnd

SectionGroup "Documentation" SEC_documentation
 Section "reference" SEC_ref
  SetOverwrite ifnewer
  SetOutPath "$GEM_OUTDIR"
  File /r /x .svn "${BASE_INDIR}\help\*.pd"
 SectionEnd
 Section "examples" SEC_examples
  SetOverwrite ifnewer
  SetOutPath "$GEM_OUTDIR\examples\"
  File /r /x .svn /x "Makefile*" "${BASE_INDIR}\examples\*.*"
  ; this should only be set if there is no entry yet
  WriteRegStr SHCTX "Environment" "GEM_DEFAULT_FONT" "$GEM_OUTDIR\examples\data\vera.ttf"
 SectionEnd
 Section "manual" SEC_manual
  SetOverwrite ifnewer
  SetOutPath "$GEM_OUTDIR\manual"
  File /r /x .svn "${BASE_INDIR}\doc\manual\*.*"
 SectionEnd
 Section "doc" SEC_doc
  SetOverwrite ifnewer
  SetOutPath "$GEM_OUTDIR"
  File "${BASE_INDIR}\doc\cMatrix.html"
  File "${BASE_INDIR}\doc\gem.known_bugs.txt"
  File "${BASE_INDIR}\doc\GemPrimer.pdf"
  File "${BASE_INDIR}\doc\gem.release_notes.txt"
  File "${BASE_INDIR}\doc\gem.todo.txt"
 SectionEnd
SectionGroupEnd

SectionGroup "plugins"

  Section "DirectShow movies" SEC_plugin_filmDS
   SetOverwrite ifnewer
   SetOutPath "$GEM_OUTDIR"
   File "${BUILD_INDIR}\gem_filmDS.dll"
  SectionEnd
  Section "QuickTime movies" SEC_plugin_filmQT
   SetOverwrite ifnewer
   SetOutPath "$GEM_OUTDIR"
   File "${BUILD_INDIR}\gem_filmQT.dll"
  SectionEnd
  Section /o "AVI movies" SEC_plugin_filmAVI
   SetOverwrite ifnewer
   SetOutPath "$GEM_OUTDIR"
   File "${BUILD_INDIR}\gem_filmAVI.dll"
  SectionEnd

  Section "ImageMagick images" SEC_plugin_imageMAGICK
   SetOverwrite ifnewer
   SetOutPath "$GEM_OUTDIR"
   File "${BUILD_INDIR}\gem_imageMAGICK.dll"
  SectionEnd
  Section "QuickTime images" SEC_plugin_imageQT
   SetOverwrite ifnewer
   SetOutPath "$GEM_OUTDIR"
   File "${BUILD_INDIR}\gem_imageQT.dll"
  SectionEnd
  Section /o "SGI images" SEC_plugin_imageSGI
   SetOverwrite ifnewer
   SetOutPath "$GEM_OUTDIR"
   File "${BUILD_INDIR}\gem_imageSGI.dll"
  SectionEnd
  Section /o "JPEG images" SEC_plugin_imageJPEG
   SetOverwrite ifnewer
   SetOutPath "$GEM_OUTDIR"
   File "${BUILD_INDIR}\gem_imageJPEG.dll"
  SectionEnd
  Section /o "TIFF images" SEC_plugin_imageTIFF
   SetOverwrite ifnewer
   SetOutPath "$GEM_OUTDIR"
   File "${BUILD_INDIR}\gem_imageTIFF.dll"
  SectionEnd

  Section "QuickTime recording" SEC_plugin_recordQT
   SetOverwrite ifnewer
   SetOutPath "$GEM_OUTDIR"
   File "${BUILD_INDIR}\gem_recordQT.dll"
  SectionEnd

  Section "DirectShow capturing" SEC_plugin_videoDS
   SetOverwrite ifnewer
   SetOutPath "$GEM_OUTDIR"
   File "${BUILD_INDIR}\gem_videoDS.dll"
  SectionEnd
  Section /o "VFW capturing" SEC_plugin_videoVFW
   SetOverwrite ifnewer
   SetOutPath "$GEM_OUTDIR"
   File "${BUILD_INDIR}\gem_videoVFW.dll"
  SectionEnd
  Section /o "Allied Vision Technologies capturing" SEC_plugin_videoAVT
   SetOverwrite ifnewer
   SetOutPath "$GEM_OUTDIR"
   File "${BUILD_INDIR}\gem_videoAVT.dll"
  SectionEnd
  Section /o "MVTec/HALCON capturing" SEC_plugin_videoHALCON
   SetOverwrite ifnewer
   SetOutPath "$GEM_OUTDIR"
   File "${BUILD_INDIR}\gem_videoHALCON.dll"
  SectionEnd
  Section /o "Basler/PYLON capturing" SEC_plugin_videoPYLON
   SetOverwrite ifnewer
   SetOutPath "$GEM_OUTDIR"
   File "${BUILD_INDIR}\gem_videoPYLON.dll"
  SectionEnd
SectionGroupEnd

SectionGroup "extra" SEC_extra
 Section "pix_drum" SEC_extra_pix_drum
  SetOverwrite ifnewer
  SetOutPath "$EXTRA_OUTDIR\pix_drum"
  File "${BASE_INDIR}\extra\pix_drum\pix_drum.dll"
  File "${BASE_INDIR}\extra\pix_drum\pix_drum-help.pd"
  File "${BASE_INDIR}\extra\pix_drum\LICENSE.txt"
 SectionEnd
 Section "pix_mano" SEC_extra_pix_mano
  SetOverwrite ifnewer
  SetOutPath "$EXTRA_OUTDIR\pix_mano"
  File "${BASE_INDIR}\extra\pix_mano\pix_mano.dll"
  File "${BASE_INDIR}\extra\pix_mano\pix_mano-help.pd"
  File "${BASE_INDIR}\extra\pix_mano\LICENSE.txt"
 SectionEnd
 Section "pix_fiducialtrack" SEC_extra_pix_fiducialtrack
  SetOverwrite ifnewer
  SetOutPath "$EXTRA_OUTDIR\pix_fiducialtrack"
  File "${BASE_INDIR}\extra\pix_fiducialtrack\pix_fiducialtrack.dll"
  File "${BASE_INDIR}\extra\pix_fiducialtrack\pix_fiducialtrack-help.pd"
  File "${BASE_INDIR}\extra\pix_fiducialtrack\all.trees"
 SectionEnd
 Section "pix_artoolkit" SEC_extra_pix_artoolkit
  SetOverwrite ifnewer
  SetOutPath "$EXTRA_OUTDIR\pix_artoolkit"
  File "${BASE_INDIR}\extra\pix_artoolkit\pix_artoolkit.dll"
  File "${BASE_INDIR}\extra\pix_artoolkit\pix_artoolkit-help.pd"
  File "${BASE_INDIR}\extra\pix_artoolkit\README.txt"
  File "${BASE_INDIR}\extra\pix_artoolkit\camera_para.dat"
  File "${BASE_INDIR}\extra\pix_artoolkit\patt.hiro"
  File "${BASE_INDIR}\extra\pix_artoolkit\pattHiro.pdf"
 SectionEnd
SectionGroupEnd

Section "Development" SEC_dev
 SetOverwrite ifnewer

 SetOutPath "$GEMDEV_OUTDIR"
 File "${BUILD_INDIR}\Gem.lib"

 SetOutPath "$GEMDEV_OUTDIR\RTE"
 File ${BASE_INDIR}\src\RTE\MessageCallbacks.h
 File ${BASE_INDIR}\src\RTE\Array.h
 SetOutPath "$GEMDEV_OUTDIR\Gem"
 File ${BASE_INDIR}\src\Gem\ThreadSemaphore.h
 File ${BASE_INDIR}\src\Gem\ThreadMutex.h
 File ${BASE_INDIR}\src\Gem\SynchedWorkerThread.h
 File ${BASE_INDIR}\src\Gem\WorkerThread.h
 File ${BASE_INDIR}\src\Gem\PixConvert.h
 File ${BASE_INDIR}\src\Gem\ImageIO.h
 File ${BASE_INDIR}\src\Gem\Image.h
 File ${BASE_INDIR}\src\Gem\GLStack.h
 File ${BASE_INDIR}\src\Gem\wglew.h
 File ${BASE_INDIR}\src\Gem\glxew.h
 File ${BASE_INDIR}\src\Gem\glew.h
 File ${BASE_INDIR}\src\Gem\GemGL.h
 File ${BASE_INDIR}\src\Gem\Event.h
 File ${BASE_INDIR}\src\Gem\PBuffer.h
 File ${BASE_INDIR}\src\Gem\Manager.h
 File ${BASE_INDIR}\src\Gem\Loaders.h
 File ${BASE_INDIR}\src\Gem\Settings.h
 File ${BASE_INDIR}\src\Gem\Properties.h
 File ${BASE_INDIR}\src\Gem\ContextData.h
 File ${BASE_INDIR}\src\Gem\Files.h
 File ${BASE_INDIR}\src\Gem\Dylib.h
 File ${BASE_INDIR}\src\Gem\Exception.h
 File ${BASE_INDIR}\src\Gem\Cache.h
 File ${BASE_INDIR}\src\Gem\State.h
 File ${BASE_INDIR}\src\Gem\RTE.h
 File ${BASE_INDIR}\src\Gem\Version.h
 File ${BASE_INDIR}\src\Gem\ExportDef.h
 SetOutPath "$GEMDEV_OUTDIR\Utils"
 File ${BASE_INDIR}\src\Utils\Vector.h
 File ${BASE_INDIR}\src\Utils\SIMD.h
 File ${BASE_INDIR}\src\Utils\PixPete.h
 File ${BASE_INDIR}\src\Utils\Matrix.h
 File ${BASE_INDIR}\src\Utils\GemMath.h
 File ${BASE_INDIR}\src\Utils\GLUtil.h
 File ${BASE_INDIR}\src\Utils\Functions.h
 File ${BASE_INDIR}\src\Utils\any.h
 SetOutPath "$GEMDEV_OUTDIR\Base"
 File ${BASE_INDIR}\src\Base\GemContext.h
 File ${BASE_INDIR}\src\Base\GemWindow.h
 File ${BASE_INDIR}\src\Base\TextBase.h
 File ${BASE_INDIR}\src\Base\GemShape.h
 File ${BASE_INDIR}\src\Base\GemPixDualObj.h
 File ${BASE_INDIR}\src\Base\GemPixObj.h
 File ${BASE_INDIR}\src\Base\GemPathBase.h
 File ${BASE_INDIR}\src\Base\GemGluObj.h
 File ${BASE_INDIR}\src\Base\GemGLBase.h
 File ${BASE_INDIR}\src\Base\GemBase.h
 File ${BASE_INDIR}\src\Base\CPPExtern.h
 SetOutPath "$GEMDEV_OUTDIR\plugins"
 File ${BASE_INDIR}\src\plugins\video.h
 File ${BASE_INDIR}\src\plugins\record.h
 File ${BASE_INDIR}\src\plugins\imagesaver.h
 File ${BASE_INDIR}\src\plugins\imageloader.h
 File ${BASE_INDIR}\src\plugins\image.h
 File ${BASE_INDIR}\src\plugins\film.h
 File ${BASE_INDIR}\src\plugins\PluginFactoryTimple.h
 File ${BASE_INDIR}\src\plugins\PluginFactory.h
 SetOutPath "$GEMDEV_OUTDIR\Base"
 File ${BASE_INDIR}\src\deprecated\Base\Matrix.h
 File ${BASE_INDIR}\src\deprecated\Base\GemVersion.h
 File ${BASE_INDIR}\src\deprecated\Base\GemVector.h
 File ${BASE_INDIR}\src\deprecated\Base\GemState.h
 File ${BASE_INDIR}\src\deprecated\Base\GemSIMD.h
 File ${BASE_INDIR}\src\deprecated\Base\GemPixUtil.h
 File ${BASE_INDIR}\src\deprecated\Base\GemPixPete.h
 File ${BASE_INDIR}\src\deprecated\Base\GemPixImageSave.h
 File ${BASE_INDIR}\src\deprecated\Base\GemPixImageLoad.h
 File ${BASE_INDIR}\src\deprecated\Base\GemPixConvert.h
 File ${BASE_INDIR}\src\deprecated\Base\GemPBuffer.h
 File ${BASE_INDIR}\src\deprecated\Base\GemMath.h
 File ${BASE_INDIR}\src\deprecated\Base\GemMan.h
 File ${BASE_INDIR}\src\deprecated\Base\GemLoaders.h
 File ${BASE_INDIR}\src\deprecated\Base\GemGLUtil.h
 File ${BASE_INDIR}\src\deprecated\Base\GemGL.h
 File ${BASE_INDIR}\src\deprecated\Base\GemFuncUtil.h
 File ${BASE_INDIR}\src\deprecated\Base\GemExportDef.h
 File ${BASE_INDIR}\src\deprecated\Base\GemEvent.h
 File ${BASE_INDIR}\src\deprecated\Base\GemContextData.h
 File ${BASE_INDIR}\src\deprecated\Base\GemCache.h


 WriteRegStr SHCTX "Environment" "GemDevDir" "$GEMDEV_OUTDIR"
SectionEnd


Function .onInit
 ; prevent multiple instances running at the same time
 System::Call 'kernel32::CreateMutexA(i 0, i 0, t "gemInstallerMutex") i .r1 ?e'
 Pop $R0
 StrCmp $R0 0 +3
  MessageBox MB_OK|MB_ICONEXCLAMATION "The installer is already running."
  Abort
FunctionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) has been successfully uninstalled."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Do you really want to uninstall $(^Name) and all it's components?" IDYES +2
  Abort
StrCpy $EXTRA_OUTDIR "$INSTDIR\.."
StrCpy $GEM_OUTDIR "$INSTDIR"
StrCpy $GEMDEV_OUTDIR "$GEM_OUTDIR\dev"
FunctionEnd

; u�h: isn't there a way to only delete the files we actually installed?
; that is: without having to enumerate them here
Section Uninstall
  Delete "$GEM_OUTDIR\manual\*.*"
  RMDir  "$GEM_OUTDIR\manual"

  Delete "$GEM_OUTDIR\cMatrix.html"
  Delete "$GEM_OUTDIR\gem.known_bugs.txt"
  Delete "$GEM_OUTDIR\GemPrimer.pdf"
  Delete "$GEM_OUTDIR\gem.release_notes.txt"
  Delete "$GEM_OUTDIR\gem.todo.txt"

  Delete "$GEM_OUTDIR\examples\data\*.*"
  Delete "$GEM_OUTDIR\examples\99.games\*.pd"
  Delete "$GEM_OUTDIR\examples\13.recursion\*.pd"
  Delete "$GEM_OUTDIR\examples\13.recursion\README"
  Delete "$GEM_OUTDIR\examples\12.multi_screen_projection\*.pd"
  Delete "$GEM_OUTDIR\examples\12.multi_screen_projection\*.frag"
  Delete "$GEM_OUTDIR\examples\12.multi_screen_projection\*.vert"
  Delete "$GEM_OUTDIR\examples\12.multi_screen_projection\config.txt"
  Delete "$GEM_OUTDIR\examples\12.multi_screen_projection\grid.jpg"
  Delete "$GEM_OUTDIR\examples\11.obj-exporter\*.pd"
  Delete "$GEM_OUTDIR\examples\10.glsl\*.frag"
  Delete "$GEM_OUTDIR\examples\10.glsl\*.vert"
  Delete "$GEM_OUTDIR\examples\10.glsl\*.geom"
  Delete "$GEM_OUTDIR\examples\10.glsl\*.jpg"
  Delete "$GEM_OUTDIR\examples\10.glsl\*.pd"
  Delete "$GEM_OUTDIR\examples\09.openGL\*.pd"
  Delete "$GEM_OUTDIR\examples\08.io\*.pd"
  Delete "$GEM_OUTDIR\examples\07.texture\*.pd"
  Delete "$GEM_OUTDIR\examples\06.particle\*.pd"
  Delete "$GEM_OUTDIR\examples\05.text\*.ttf"
  Delete "$GEM_OUTDIR\examples\05.text\*.pd"
  Delete "$GEM_OUTDIR\examples\04.video\*.pd"
  Delete "$GEM_OUTDIR\examples\04.pix\*.pd"
  Delete "$GEM_OUTDIR\examples\03.lighting\*.pd"
  Delete "$GEM_OUTDIR\examples\02.advanced\*.pd"
  Delete "$GEM_OUTDIR\examples\01.basic\*.pd"
  RMDir  "$GEM_OUTDIR\examples\data"
  RMDir  "$GEM_OUTDIR\examples\99.games"
  RMDir  "$GEM_OUTDIR\examples\13.recursion"
  RMDir  "$GEM_OUTDIR\examples\12.multi_screen_projection"
  RMDir  "$GEM_OUTDIR\examples\11.obj-exporter"
  RMDir  "$GEM_OUTDIR\examples\10.glsl"
  RMDir  "$GEM_OUTDIR\examples\09.openGL"
  RMDir  "$GEM_OUTDIR\examples\08.io"
  RMDir  "$GEM_OUTDIR\examples\07.texture"
  RMDir  "$GEM_OUTDIR\examples\06.particle"
  RMDir  "$GEM_OUTDIR\examples\05.text"
  RMDir  "$GEM_OUTDIR\examples\04.video"
  RMDir  "$GEM_OUTDIR\examples\04.pix"
  RMDir  "$GEM_OUTDIR\examples\03.lighting"
  RMDir  "$GEM_OUTDIR\examples\02.advanced"
  RMDir  "$GEM_OUTDIR\examples\01.basic"
  RMDir  "$GEM_OUTDIR\examples"

  Delete "$GEM_OUTDIR\pix_*.pd"
  Delete "$GEM_OUTDIR\*-help.pd"
  Delete "$GEM_OUTDIR\*.pd"

  Delete "$GEM_OUTDIR\gem_filmAVI.dll"
  Delete "$GEM_OUTDIR\gem_filmDS.dll"
  Delete "$GEM_OUTDIR\gem_filmQT.dll"
  Delete "$GEM_OUTDIR\gem_imageJPEG.dll"
  Delete "$GEM_OUTDIR\gem_imageMAGICK.dll"
  Delete "$GEM_OUTDIR\gem_imageQT.dll"
  Delete "$GEM_OUTDIR\gem_imageSGI.dll"
  Delete "$GEM_OUTDIR\gem_imageTIFF.dll"
  Delete "$GEM_OUTDIR\gem_recordQT.dll"
  Delete "$GEM_OUTDIR\gem_videoAVT.dll"
  Delete "$GEM_OUTDIR\gem_videoDS.dll"
  Delete "$GEM_OUTDIR\gem_videoHALCON.dll"
  Delete "$GEM_OUTDIR\gem_videoPYLON.dll"
  Delete "$GEM_OUTDIR\gem_videoVFW.dll"
  Delete "$GEM_OUTDIR\Gem.dll"
  Delete "$GEM_OUTDIR\GnuGPL.LICENSE.txt"
  Delete "$GEM_OUTDIR\COPYING.txt"
  Delete "$GEM_OUTDIR\ChangeLog"
  Delete "$GEM_OUTDIR\README.txt"

  /* Development */
  Delete "$GEMDEV_OUTDIR\Gem.lib"
  Delete "$GEMDEV_OUTDIR\RTE\MessageCallbacks.h"
  Delete "$GEMDEV_OUTDIR\RTE\Array.h"
  Delete "$GEMDEV_OUTDIR\Gem\ThreadSemaphore.h"
  Delete "$GEMDEV_OUTDIR\Gem\ThreadMutex.h"
  Delete "$GEMDEV_OUTDIR\Gem\SynchedWorkerThread.h"
  Delete "$GEMDEV_OUTDIR\Gem\WorkerThread.h"
  Delete "$GEMDEV_OUTDIR\Gem\PixConvert.h"
  Delete "$GEMDEV_OUTDIR\Gem\ImageIO.h"
  Delete "$GEMDEV_OUTDIR\Gem\Image.h"
  Delete "$GEMDEV_OUTDIR\Gem\GLStack.h"
  Delete "$GEMDEV_OUTDIR\Gem\wglew.h"
  Delete "$GEMDEV_OUTDIR\Gem\glxew.h"
  Delete "$GEMDEV_OUTDIR\Gem\glew.h"
  Delete "$GEMDEV_OUTDIR\Gem\GemGL.h"
  Delete "$GEMDEV_OUTDIR\Gem\Event.h"
  Delete "$GEMDEV_OUTDIR\Gem\PBuffer.h"
  Delete "$GEMDEV_OUTDIR\Gem\Manager.h"
  Delete "$GEMDEV_OUTDIR\Gem\Loaders.h"
  Delete "$GEMDEV_OUTDIR\Gem\Settings.h"
  Delete "$GEMDEV_OUTDIR\Gem\Properties.h"
  Delete "$GEMDEV_OUTDIR\Gem\ContextData.h"
  Delete "$GEMDEV_OUTDIR\Gem\Files.h"
  Delete "$GEMDEV_OUTDIR\Gem\Dylib.h"
  Delete "$GEMDEV_OUTDIR\Gem\Exception.h"
  Delete "$GEMDEV_OUTDIR\Gem\Cache.h"
  Delete "$GEMDEV_OUTDIR\Gem\State.h"
  Delete "$GEMDEV_OUTDIR\Gem\RTE.h"
  Delete "$GEMDEV_OUTDIR\Gem\Version.h"
  Delete "$GEMDEV_OUTDIR\Gem\ExportDef.h"
  Delete "$GEMDEV_OUTDIR\Utils\Vector.h"
  Delete "$GEMDEV_OUTDIR\Utils\SIMD.h"
  Delete "$GEMDEV_OUTDIR\Utils\PixPete.h"
  Delete "$GEMDEV_OUTDIR\Utils\Matrix.h"
  Delete "$GEMDEV_OUTDIR\Utils\GemMath.h"
  Delete "$GEMDEV_OUTDIR\Utils\GLUtil.h"
  Delete "$GEMDEV_OUTDIR\Utils\Functions.h"
  Delete "$GEMDEV_OUTDIR\Utils\any.h"
  Delete "$GEMDEV_OUTDIR\Base\GemContext.h"
  Delete "$GEMDEV_OUTDIR\Base\GemWindow.h"
  Delete "$GEMDEV_OUTDIR\Base\TextBase.h"
  Delete "$GEMDEV_OUTDIR\Base\GemShape.h"
  Delete "$GEMDEV_OUTDIR\Base\GemPixDualObj.h"
  Delete "$GEMDEV_OUTDIR\Base\GemPixObj.h"
  Delete "$GEMDEV_OUTDIR\Base\GemPathBase.h"
  Delete "$GEMDEV_OUTDIR\Base\GemGluObj.h"
  Delete "$GEMDEV_OUTDIR\Base\GemGLBase.h"
  Delete "$GEMDEV_OUTDIR\Base\GemBase.h"
  Delete "$GEMDEV_OUTDIR\Base\CPPExtern.h"
  Delete "$GEMDEV_OUTDIR\plugins\video.h"
  Delete "$GEMDEV_OUTDIR\plugins\record.h"
  Delete "$GEMDEV_OUTDIR\plugins\imagesaver.h"
  Delete "$GEMDEV_OUTDIR\plugins\imageloader.h"
  Delete "$GEMDEV_OUTDIR\plugins\image.h"
  Delete "$GEMDEV_OUTDIR\plugins\film.h"
  Delete "$GEMDEV_OUTDIR\plugins\PluginFactoryTimple.h"
  Delete "$GEMDEV_OUTDIR\plugins\PluginFactory.h"
  Delete "$GEMDEV_OUTDIR\Base\Matrix.h"
  Delete "$GEMDEV_OUTDIR\Base\GemVersion.h"
  Delete "$GEMDEV_OUTDIR\Base\GemVector.h"
  Delete "$GEMDEV_OUTDIR\Base\GemState.h"
  Delete "$GEMDEV_OUTDIR\Base\GemSIMD.h"
  Delete "$GEMDEV_OUTDIR\Base\GemPixUtil.h"
  Delete "$GEMDEV_OUTDIR\Base\GemPixPete.h"
  Delete "$GEMDEV_OUTDIR\Base\GemPixImageSave.h"
  Delete "$GEMDEV_OUTDIR\Base\GemPixImageLoad.h"
  Delete "$GEMDEV_OUTDIR\Base\GemPixConvert.h"
  Delete "$GEMDEV_OUTDIR\Base\GemPBuffer.h"
  Delete "$GEMDEV_OUTDIR\Base\GemMath.h"
  Delete "$GEMDEV_OUTDIR\Base\GemMan.h"
  Delete "$GEMDEV_OUTDIR\Base\GemLoaders.h"
  Delete "$GEMDEV_OUTDIR\Base\GemGLUtil.h"
  Delete "$GEMDEV_OUTDIR\Base\GemGL.h"
  Delete "$GEMDEV_OUTDIR\Base\GemFuncUtil.h"
  Delete "$GEMDEV_OUTDIR\Base\GemExportDef.h"
  Delete "$GEMDEV_OUTDIR\Base\GemEvent.h"
  Delete "$GEMDEV_OUTDIR\Base\GemContextData.h"
  Delete "$GEMDEV_OUTDIR\Base\GemCache.h"
  RMDir  "$GEMDEV_OUTDIR\RTE"
  RMDir  "$GEMDEV_OUTDIR\Gem"
  RMDir  "$GEMDEV_OUTDIR\Utils"
  RMDir  "$GEMDEV_OUTDIR\Base"
  RMDir  "$GEMDEV_OUTDIR\plugins"
  RMDir  "$GEMDEV_OUTDIR\Base"

  /* extra */
  Delete "$EXTRA_OUTDIR\pix_drum\pix_drum.dll"
  Delete "$EXTRA_OUTDIR\pix_drum\pix_drum-help.pd"
  Delete "$EXTRA_OUTDIR\pix_drum\LICENSE.txt"
  Delete "$EXTRA_OUTDIR\pix_mano\pix_mano.dll"
  Delete "$EXTRA_OUTDIR\pix_mano\pix_mano-help.pd"
  Delete "$EXTRA_OUTDIR\pix_mano\LICENSE.txt"
  Delete "$EXTRA_OUTDIR\pix_fiducialtrack\pix_fiducialtrack.dll"
  Delete "$EXTRA_OUTDIR\pix_fiducialtrack\pix_fiducialtrack-help.pd"
  Delete "$EXTRA_OUTDIR\pix_fiducialtrack\all.trees"
  Delete "$EXTRA_OUTDIR\pix_artoolkit\pix_artoolkit.dll"
  Delete "$EXTRA_OUTDIR\pix_artoolkit\pix_artoolkit-help.pd"
  Delete "$EXTRA_OUTDIR\pix_artoolkit\README.txt"
  Delete "$EXTRA_OUTDIR\pix_artoolkit\camera_para.dat"
  Delete "$EXTRA_OUTDIR\pix_artoolkit\patt.hiro"
  Delete "$EXTRA_OUTDIR\pix_artoolkit\pattHiro.pdf"

  RMDir  "$EXTRA_OUTDIR\pix_drum"
  RMDir  "$EXTRA_OUTDIR\pix_mano"
  RMDir  "$EXTRA_OUTDIR\pix_fiducialtrack"
  RMDir  "$EXTRA_OUTDIR\pix_artoolkit"

  Delete "$GEM_OUTDIR\uninst.exe"
  RMDir  "$GEM_OUTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  ; try to delete   SHCTX \"Environment"\"GEM_DEFAULT_FONT" if it is "$GEM_OUTDIR\examples\data\vera.ttf"

  SetAutoClose true
SectionEnd

Section -Post
  WriteUninstaller "$GEM_OUTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$GEM_OUTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
 !insertmacro MUI_DESCRIPTION_TEXT ${SEC_Gem} "Graphical Environment for Multimedia"
 !insertmacro MUI_DESCRIPTION_TEXT ${SEC_GemBinary} "the Gem binary"
 !insertmacro MUI_DESCRIPTION_TEXT ${SEC_GemAbs} "Gem-abstractions"
 !insertmacro MUI_DESCRIPTION_TEXT ${SEC_documentation} "Gem documentation: patches, HTML, PDFs,..."
 !insertmacro MUI_DESCRIPTION_TEXT ${SEC_ref} "reference patches for Gem-objects"
 !insertmacro MUI_DESCRIPTION_TEXT ${SEC_examples} "a large number of patches showing what to do with GEM"
 !insertmacro MUI_DESCRIPTION_TEXT ${SEC_manual} "HTML-manual"
 !insertmacro MUI_DESCRIPTION_TEXT ${SEC_doc} "Gem primer,..."

#plugins
 !insertmacro MUI_DESCRIPTION_TEXT ${SEC_plugin_filmDS} "allows to read movies using DirectShow filters"
 !insertmacro MUI_DESCRIPTION_TEXT ${SEC_plugin_filmQT} "allows to read movies using Apple's QuickTime library (if present)"
 !insertmacro MUI_DESCRIPTION_TEXT ${SEC_plugin_filmAVI} "allows to read movies using Microsoft's old (and deprecated) AVI library"

 !insertmacro MUI_DESCRIPTION_TEXT ${SEC_plugin_recordQT} "allows to output Gem-pixes into QuickTime MOVie files"

!insertmacro MUI_DESCRIPTION_TEXT ${SEC_plugin_imageMAGICK} "allows to read/write still images using ImageMagick (this can virtually read/write any image format, including but not limited to JPEG, TIFF and SGI, so it's probably the only 'image' plugin you need)"
!insertmacro MUI_DESCRIPTION_TEXT ${SEC_plugin_imageQT} "allows to read/write still images using Apple's QuickTime (you will have to download and install QuickTime for Windows yourself in order to use this)"
!insertmacro MUI_DESCRIPTION_TEXT ${SEC_plugin_imageSGI} "allows to read SGI images"
!insertmacro MUI_DESCRIPTION_TEXT ${SEC_plugin_imageJPEG} "allows to read/write JPEG images"
!insertmacro MUI_DESCRIPTION_TEXT ${SEC_plugin_imageTIFF} "allows to read/write TIFF images"

 !insertmacro MUI_DESCRIPTION_TEXT ${SEC_plugin_videoDS} "allows to capture live video sources using DirectShow filters"
 !insertmacro MUI_DESCRIPTION_TEXT ${SEC_plugin_videoVFW} "allows to capture live video using Microsoft's old (and deprecated) Video-For-Windows method"
!insertmacro MUI_DESCRIPTION_TEXT ${SEC_plugin_videoAVT} "allows to capture live video from GigE-cameras using AVT (Allied Vision Technologies); supported cameras include the Prosilica family (http://www.alliedvisiontec.com) "
!insertmacro MUI_DESCRIPTION_TEXT ${SEC_plugin_videoHALCON} "allows to capture live video from a number of devices (including GigE-cameras and industry grade frame grabbers) using MVTec's HALCON library; you will need to purchase a license from MVTec in order to be able to use this plugin (http://www.mvtec.com) "
!insertmacro MUI_DESCRIPTION_TEXT ${SEC_plugin_videoPYLON} "allows to capture live video from GigE-cameras using Basler's PYLON library; mainly supports Basler cameras; you might need to download additional software in order to use this plugin (http://www.baslerweb.com)"


!insertmacro MUI_DESCRIPTION_TEXT ${SEC_extra} "additional objectclasses"
!insertmacro MUI_DESCRIPTION_TEXT ${SEC_extra_pix_drum} "Jaime Olivier's [pix_drum] object for his 'Silent Drum'"
!insertmacro MUI_DESCRIPTION_TEXT ${SEC_extra_pix_mano} "Jaime Olivier's [pix_mano] object"
!insertmacro MUI_DESCRIPTION_TEXT ${SEC_extra_pix_fiducialtrack} "a port of the reactable(tm)'s fiducial tracking algorithm"
!insertmacro MUI_DESCRIPTION_TEXT ${SEC_extra_pix_artoolkit} "fiducial tracking using ARToolkit markers"

!insertmacro MUI_DESCRIPTION_TEXT ${SEC_dev} "Headers and Library-Files for developing your own Gem objects"

!insertmacro MUI_FUNCTION_DESCRIPTION_END
