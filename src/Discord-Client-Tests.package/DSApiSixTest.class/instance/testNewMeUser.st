tests
testNewMeUser
	| user |
	self startZnServer.
	api := self newRestApi.
	api apiUrl: self apiUrl.
	api token: self tokenString.
	self serverDelegate map: '/api/users/@me' to: [ :request :response |
		self serverRequests add: request.
		response entity: (ZnEntity text: '{"username": "example user name", "verified": false, "mfa_enabled": false, "id": "1234", "phone": null, "avatar": null, "discriminator": "5678", "email": "email@example.com"}') ].
	user := api newMeUser.
	self assert: user notNil.
	self assert: user username equals: 'example user name'.
	self assert: user restApi == api description: 'It should have the api object'.
	self assert: self serverRequests size equals: 1.
	self assert: self serverRequests first method equals: #GET.