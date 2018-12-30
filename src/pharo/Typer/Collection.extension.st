Extension { #name : #Collection }

{ #category : #'*Typer' }
Collection >> typAsType [
	<typTypeResultAs: 'TypType'>
	| remains |
	remains := (self "typParameters TypType"
		flatCollect: [ :e | 
			e isUnion
				ifTrue: [ e "typCastAs TypUnionType" types ]
				ifFalse: [ {e} ] ]) asSet.
	remains ifEmpty: [ ^ TypUnknownType instance ].
	remains size = 1
		ifTrue: [ ^ remains anyOne ].
	^ TypUnionType new
		types: remains;
		yourself.
]
