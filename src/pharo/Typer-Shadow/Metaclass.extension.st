Extension { #name : #Metaclass }

{ #category : #'*Typer-Shadow' }
Metaclass >> typShaShadows [
	^ TypShaShadow allSubclasses select: [ :e | e shadowedClass == self ]
]
