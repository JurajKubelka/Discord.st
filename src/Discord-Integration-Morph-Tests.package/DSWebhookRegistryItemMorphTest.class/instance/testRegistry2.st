tests
testRegistry2
	| registry |
	morph := self classToTest new.
	window := morph openInWindow.
	registry := DSWebhookRegistry developmentChannel.
	morph registry: registry.
	self assert: morph submorphs second contents equals: registry name.
	