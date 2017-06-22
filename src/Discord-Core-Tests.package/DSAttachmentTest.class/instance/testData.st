tests
testData
	| bytes |
	self startZnServer.
	self serverDelegate map: '/' to: [ :request :response | 
		response entity: (ZnEntity bytes: self bytes) ].
	attachment := self newAttachment.
	attachment url: self serverUrl.
	attachment api: self newApi.
	bytes := attachment data.
	self assert: bytes equals: self bytes.
	self assert: attachment data == bytes.
	self assert: attachment hasData.