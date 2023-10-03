Extension { #name : #TypInfNode }

{ #category : #'*Typer-Checker' }
TypInfNode >> typChe [
	
]

{ #category : #'*Typer-Checker' }
TypInfNode >> typCheErrors [
	| errors |
	errors := OrderedCollection new.
	[ self typChe ]
		on: TypCheWarning
		do: [ :e | 
			errors add: e.
			e resume ].
	^ errors sorted: [ :a :b | a priority < b priority ]
]
