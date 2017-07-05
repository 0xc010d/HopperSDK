#!/bin/bash

SCRIPT_PATH=$(dirname "$0")
cd "$SCRIPT_PATH"
echo "Executing script in $PWD"

## Variables
SUFFIX=$(uname)-$(arch)

GNUSTEP_MAKE_REV=57e4e7baaa6a1a93dea0939cef0cc6617e73a337
GNUSTEP_LIBOBJC2_REV=d1eb9ad91e45af19d16c3ef9bb742eb9df822c5a
GNUSTEP_BASE_REV=176f96a06193b7e576e9ab1490113b6e63e27238
LIBDISPATCH_REV=bd1808980b04830cbbd79c959b8bc554085e38a1

JOBS=4
DEST=$(pwd)/gnustep-$SUFFIX
LAYOUT=fhs

CC=clang
CXX=clang++

## Cleanup
echo "Cleaning"
rm -rf "$DEST"
rm -rf sources ; mkdir sources

## Download sources
echo ""
echo "---------------------------------"
echo "Downloading sources"
echo ""

cd sources
echo "  libobjc2..."
git clone https://github.com/gnustep/libobjc2.git gnustep-libobjc2  || exit 1
echo "  gnustep-make..."
git clone https://github.com/gnustep/make gnustep-make  || exit 1
echo "  gnustep-base..."
git clone https://github.com/gnustep/base.git gnustep-base  || exit 1
echo "  libdispatch..."
git clone https://github.com/nickhutchinson/libdispatch.git  || exit 1

## Compile gnustep-make
echo ""
echo "---------------------------------"
echo "Compiling gnustep-make"
echo ""

cd gnustep-make
git checkout $GNUSTEP_MAKE_REV
./configure CC=$CC CXX=$CXX --with-layout=$LAYOUT --prefix="$DEST" || exit 1
make || exit 1
make install
cd ..

. "$DEST/share/GNUstep/Makefiles/GNUstep.sh"

## Compile the Objective-C 2 runtime
echo ""
echo "---------------------------------"
echo "Compiling libobjc2"
echo ""

cd gnustep-libobjc2
git checkout $GNUSTEP_LIBOBJC2_REV
rm -rf build ; mkdir build ; cd build
cmake .. -DCMAKE_INSTALL_PREFIX="$DEST" -DCMAKE_C_COMPILER=$CC -DCMAKE_CXX_COMPILER=$CXX -DCMAKE_ASM_COMPILER=$CC -DTESTS=off -DCMAKE_BUILD_TYPE=Release
make -j$JOBS || exit 1
make install
cd ../../

cd gnustep-make
./configure CC=$CC CXX=$CXX --enable-objc-nonfragile-abi --with-layout=$LAYOUT --prefix="$DEST" || exit 1
make || exit 1
make install
cd ..

. "$DEST/share/GNUstep/Makefiles/GNUstep.sh"

## Compile GNUstep base
echo ""
echo "---------------------------------"
echo "Compiling gnustep-base..."
echo ""

cd gnustep-base
git checkout $GNUSTEP_BASE_REV
patch -p1 <../../patches/gnustep-base.patch || exit 1
./configure CC=$CC CXX=$CXX --prefix="$DEST" --disable-bfd --disable-icu --disable-tls --disable-xslt --disable-zeroconf || exit 1
make -j$JOBS || exit 1
make install
cd ..

## Compile libdispatch
echo ""
echo "---------------------------------"
echo "Compiling libdispatch"
echo ""

cd libdispatch
git checkout $LIBDISPATCH_REV
patch -p1 <../../patches/libdispatch.patch || exit 1
mkdir build
cd build
cmake .. -DCMAKE_C_COMPILER=$CC -DCMAKE_CXX_COMPILER=$CXX -DCMAKE_INSTALL_PREFIX="$DEST" -DCMAKE_BUILD_TYPE=Release || exit 1
make || exit 1
make install
cd ../..

## Test by compiling a small Objective-C program
echo ""
echo "---------------------------------"
echo "Testing"
echo ""

cat >test.m<<_EOF
#include <Foundation/Foundation.h>
#import <dispatch/dispatch.h>

@interface A : NSObject
@end

@implementation A
- (id)init {
	if (self = [super init]) {
		NSLog(@"in init");
	}
	return self;
}

- (void)fct {
	NSLog(@"in fct");
	@autoreleasepool {
		NSMutableArray *array = [NSMutableArray array];
		for (int i=0; i<4; i++) {
			[array addObject:[[A alloc] init]];
		}
	}
}

- (void)dealloc {
	NSLog(@"in dealloc");
}
@end


int main(int argc, char **argv) {
	//@autoreleasepool {
	static dispatch_once_t predicate;
	dispatch_once(&predicate, ^ {
			A *a = [[A alloc] init];
			[a fct];
			});
	//}
	return 0;
}
_EOF

clang test.m -o test $(gnustep-config --objc-flags) $(gnustep-config --base-libs) -fobjc-arc -fobjc-nonfragile-abi -O0 -g -ldispatch && ./test && echo "ALL DONE"

