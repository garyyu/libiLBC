  ############################################################################
  ## 
  ##  Makefile  
  ## 
  ##########################################################################*

include   makefile.pre

	EXECUTABLE = libilbc.so.0.0.2

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
 iLBC_decode.o  \
 iLBC_encode.o  \
 lsf.o  \
 packing.o  \
 syntFilter.o


all:	$(EXECUTABLE)

clean: 
	@echo Build clean, all the object files and binaries are removed successfully.
	@$(RM) *.o $(OBJPATH)/*.o *~

$(EXECUTABLE):  $(OBJS) 
		$(GCC) -fPIC -DPIC -shared $(OBJS) $(LIBS) -Wl,-soname -Wl,libilbc.so.0 -o $@


%.o:	 %.c $(HEADERS)
		@$(RM) $@
		@echo $(shell pwd)/$<
		@$(GCC) $(CFLAGS) $(INCLUDE) $(CLINK) $@ $(DPARAM) $(INCLUDE) $<

