Extension { #name : #Collection }

{ #category : #'*Typer' }
Collection >> typAsType [
	<typTypeResultAs: 'TypType'>
	| remains unknown nil_ |
	remains := (self "typParameters TypType"
		flatCollect: [ :e | 
			e isUnion
				ifTrue: [ e "typCastAs TypUnionType" types ]
				ifFalse: [ {e} ] ]) asSet.
	remains ifEmpty: [ ^ TypUnknownType instance ].
	nil_ := remains includes: TypNilType instance.
	nil_ ifTrue: [ remains remove: TypNilType instance ].
	remains ifEmpty: [ ^ TypNilType instance ].
	remains size = 1 ifTrue: [ ^ remains anyOne asNullableType ].
	unknown := remains includes: TypUnknownType instance.
	unknown ifTrue: [ remains remove: TypUnknownType instance ].
	remains ifEmpty: [ ^ TypUnknownType instance ].
	remains := remains reject: [ :e | (remains copyWithout: e) anySatisfy: [ :f | f >= e ] ].
	unknown ifTrue: [ remains add: TypUnknownType instance ].
	^ TypUnionType new
		nullable: nil_;
		types: remains;
		yourself.
]
