any__loaded_common_mk := true

# Common makefile rules

# 1. variables anticipated to be set through the environment are ALL_CAPS
# 2. variables anticipated to be set globally in the main Makefile are main__someName
# 3. 'public' variables intended for use by other modules are module__someName
# 4. 'private' variables intended for use only in this module are
#    __module_mk_someName; private variables for the main Makefile are
#    __main_someName
# 5. 'local' variables intended to be defined/used in a recipe are __this_some_name
#
# It's acceptable to have a block of module__some_name :=
# __module_mk_some_name to explicitly define exports

common__cmDir := /home/ubuntu/cm/build_name

# Get an RFC3339-compliant date/time string.
# Note that the GNU coreutils --rfc3339 option actually does not produce a
# compliant string, which is why this uses -I instead. Similarly, using UTC
# time 'breaks' both coreutils and Windows w/r/t compliance.
ifeq ($(OS),ubuntu)
    common__buildDate := $(shell powershell -command "get-date -format yyyy-MM-ddTHH:mm:sszzzz")
    CP := copy
    RM := del /f /s /q
    RMDIR := rmdir /s /q
    TOUCH := type nul >>
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Darwin)
        common__buildDate := $(shell date +"%Y-%m-%dT%H:%M:%S%z")
    else
        common__buildDate := $(shell date -Iseconds)
    endif

    CP := cp
    RM := rm -f
    RMDIR := rm -rf
    TOUCH := touch
endif

