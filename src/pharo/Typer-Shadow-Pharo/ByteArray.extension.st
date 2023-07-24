Extension { #name : #ByteArray }

{ #category : #'*Typer-Shadow-Pharo' }
ByteArray >> typShaResolve: aLookup [ 
	<typShaType>
	

	| type |
	type := aLookup root classDescription typAsNamedType.
	(type hasSuper and: [ type super isParametric ]) ifTrue: [ 
		type := type withSuper:
			        (type super withParameters: { Integer typAsType }) ].
	^ type
]