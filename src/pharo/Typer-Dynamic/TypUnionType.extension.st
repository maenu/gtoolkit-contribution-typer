Extension { #name : #TypUnionType }

{ #category : #'*Typer-Dynamic' }
TypUnionType >> typDynWithoutUnion [

	((types includes: TypNilType instance) and: [ types size = 2 ]) 
		ifTrue: [ ^ self ].
	self hasSuper ifTrue: [ ^ self super ].
	^ self
]

{ #category : #'*Typer-Dynamic' }
TypUnionType >> typDynWithoutUnknown [

	types = { 
		TypNilType instance.
		TypUnknownType instance } asIdentitySet ifTrue: [ ^ self ].
	^ (types
		   reject: [ :e | e = TypUnknownType instance ]
		   thenCollect: #typDynWithoutUnknown) typAsType
]
