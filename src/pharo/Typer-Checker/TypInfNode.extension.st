Extension { #name : #TypInfNode }

{ #category : #'*Typer-Checker' }
TypInfNode >> typChe [
	self type isNullable
		ifTrue: [ TypCheNullable signal: self message: 'type is nullable' ].
	self type asNonNullable isUnknown
		ifTrue: [ TypCheUnknown signal: self message: 'type is unknown' ]
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
