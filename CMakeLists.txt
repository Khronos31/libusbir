cmake_minimum_required(VERSION 3.10)
project(libusbir VERSION 1.0.0)

# C++11を有効化
set(CMAKE_CXX_STANDARD 11)

# libusb-1.0 を探す
find_package(PkgConfig REQUIRED)
pkg_check_modules(LIBUSB REQUIRED libusb-1.0)

# 共有ライブラリの作成
add_library(usbir SHARED usbir.cpp)
target_include_directories(usbir PUBLIC ${CMAKE_CURRENT_SOURCE_DIR} ${LIBUSB_INCLUDE_DIRS})
target_link_libraries(usbir ${LIBUSB_LIBRARIES})

# インストール先の設定
install(TARGETS usbir DESTINATION lib)
install(FILES usbir.h DESTINATION include)

# --- ここから CPack の魔法 ---
set(CPACK_PACKAGE_NAME "libusbir")
set(CPACK_PACKAGE_VENDOR "Khronos31")
set(CPACK_PACKAGE_CONTACT "39792509+Khronos31@users.noreply.github.com")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "USB IR Library for AD00020")
set(CPACK_GENERATOR "DEB;RPM;TGZ") # ここで形式を指定！
include(CPack)
