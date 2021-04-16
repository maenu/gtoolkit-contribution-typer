Extension { #name : #ClassDescription }

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaShadows [
	^ (TypShaShadow allSubclasses
		flatCollect: [ :e | 
			{e.
			e instance} ]) select: [ :e | self == e shadowedClass ]
]
