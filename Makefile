  ############################################################################
  ## 
  ##  Makefile  
  ## 
  ##########################################################################*

include   makefile.pre

	EXECUTABLE = ilbc

    	OBJS = \
 FrameClassify.o  \
 LPCdecode.o  \
 LPCencode.o  \
 StateConstructW.o  \
 StateSearchW.o  \
 anaFilter.o  \
 constants.o  \
 createCB.o  \
 doCPLC.o  \
 enhancer.o  \
 filter.o  \
 gainquant.o  \
 getCBvec.o  \
 helpfun.o  \
 hpInput.o  \
 hpOutput.o  \
 iCBConstruct.o  \
 iCBSearch.o  \
 iLBC.o  \
 iLBC_decode.o  \
 iLBC_encode.o  \
 iLBC_test.o  \
 lsf.o  \
 packing.o  \
 syntFilter.o


all:	subdirs  $(EXECUTABLE)

subdirs:
	@$(RM) $(SUBOBJS)
	@echo $(CFLAGS)
	@for onesubdir in $(SUBDIRS) ; do 		\
	  $(MAKE) -C $$onesubdir -f module.mk; 		\
	  if test $$? -gt 0; then 			\
	    build_error=yes; 				\
	    break; 					\
	  fi; 						\
	done;						\
	if test "$$build_error" = "yes"; then exit 1; else :; fi

clean: 
	@echo Build clean, all the object files and binaries are removed successfully.
	@$(RM) $(OBJPATH)/*.o *~ ./include/*~
	@$(RM) $(SUBOBJS) 

$(EXECUTABLE):  $(OBJS) 
			echo -e "-------------------\nnow link the binary\n-------------------"; 	\
		    	$(GCC) $(CFLAGS) -o $@ $(OBJS) $(shell cat $(SUBOBJS)) $(LIB) -lstdc++ ;	\
			$(RM) $(SUBOBJS);				\


$(OBJPATH)/%.o:	 %.c $(HEADERS)
		@$(RM) $@
		@echo $(shell pwd)/$<
		@$(GCC) $(CFLAGS) $(CLINK) $@ $(DPARAM) $(INCLUDE) $<

