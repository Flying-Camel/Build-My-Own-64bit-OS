
# 2020 4.6 makefile.

all : BootLoader Disk.img

BootLoader : 
	@echo
	@echo ===================== Build BootLoader ===================== 
	@echo


	# Move to directory and make.
	make -C 00.BootLoader

	@echo
	@echo ===================== Build Complete ===================== 
	@echo

Disk.img: 00.BootLoader/BootLoader.bin

	@echo
	@echo ===================== Disk Image Build Start  ===================== 
	@echo

	cp 00.BootLoader/BootLoader.bin Disk.img 

	@echo
	@echo ===================== All Build Complete  ===================== 
	@echo

clean :
	make -C 00.BootLoader clean
	rm -f Disk.img

