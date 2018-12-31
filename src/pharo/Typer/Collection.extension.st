Extension { #name : #Collection }

{ #category : #'*Typer' }
Collection >> typAsType [
	<typTypeResultAs: 'TypType'>
	| remains unknown |
	remains := (self "typParameters TypType"
		flatCollect: [ :e | 
			e isUnion
				ifTrue: [ e "typCastAs TypUnionType" types ]
				ifFalse: [ {e} ] ]) asSet.
	remains ifEmpty: [ ^ TypUnknownType instance ].
	remains size = 1
		ifTrue: [ ^ remains anyOne ].
	unknown := remains includes: TypUnknownType instance.
	unknown ifTrue: [ remains remove: TypUnknownType instance ].
	remains := remains reject: [ :e | (remains copyWithout: e) anySatisfy: [ :f | f >= e ] ].
	unknown ifTrue: [ remains add: TypUnknownType instance ].
	^ TypUnionType new
		types: remains;
		yourself.
]
