Extension { #name : #SystemDictionary }

{ #category : #'*Typer-Shadow-Pharo' }
SystemDictionary >> typShaResolve: aLookup [ 
	<typShaType>
	

	| type |
	type := aLookup root classDescription typAsNamedType.
	(type hasSuper and: [ type super isParametric ]) ifTrue: [ 
		type := type withSuper:
			        (type super withParameters: { 
					         Symbol typAsType.
					         { 
						         Class typAsType.
						         TypUnknownType instance } typAsType }) ].
	^ type
]
