instance creation
newSendbarMorph
	^ DSScreenshotActionbarMorph new
		hResizing: #spaceFill; 
		vResizing: #shrinkWrap;
		onAnnouncement: #cancelAction send: #cancelAction to: self;
		onAnnouncement: #sendAction send: #sendAction to: self;
		yourself