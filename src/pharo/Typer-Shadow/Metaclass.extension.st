Extension { #name : #Metaclass }

{ #category : #'*Typer-Shadow' }
Metaclass >> typShaShadows [
	^ (TypShaShadow allSubclasses
		select:
			[ :e | e shadowedClass == self or: [ self inheritsFrom: e shadowedClass ] ])
		sorted: [ :a :b | a priority > b priority ]
]
