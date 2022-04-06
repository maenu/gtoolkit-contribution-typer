Extension { #name : #TypUnionType }

{ #category : #'*Typer-Inference' }
TypUnionType >> typInfWithoutUnion [

	((types includes: TypNilType instance) and: [ types size = 2 ]) 
		ifTrue: [ ^ self ].
	self hasSuper ifTrue: [ ^ self super ].
	^ self
]

{ #category : #'*Typer-Inference' }
TypUnionType >> typInfWithoutUnknown [

	types = { 
		TypNilType instance.
		TypUnknownType instance } asIdentitySet ifTrue: [ ^ self ].
	^ (types
		   reject: [ :e | e = TypUnknownType instance ]
		   thenCollect: #typInfWithoutUnknown) typAsType
]
