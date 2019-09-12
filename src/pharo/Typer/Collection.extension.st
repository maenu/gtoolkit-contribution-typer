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
	remains := remains reject: [ :e | (remains copyWithout: e) anySatisfy: [ :f | f >= e ] ].
	remains ifEmpty: [ ^ TypUnknownType instance ].
	nil_ := remains includes: TypNilType instance.
	nil_ ifTrue: [ remains remove: TypNilType instance ].
	remains ifEmpty: [ ^ TypNilType instance ].
	remains size = 1 ifTrue: [ ^ nil_ ifTrue: [ remains anyOne asNullableType ] ifFalse: [ remains anyOne ] ].
	unknown := remains includes: TypUnknownType instance.
	unknown ifTrue: [ remains remove: TypUnknownType instance ].
	remains ifEmpty: [ ^ TypUnknownType instance ].
	unknown ifTrue: [ remains add: TypUnknownType instance ].
	^ TypUnionType new
		nullable: nil_;
		types: remains;
		yourself.
]

{ #category : #'*Typer' }
Collection >> typSelfType [
	| type |
	type := super typSelfType.
	(type isParametric
		and: [ type parameters size = 1 and: [ type parameters first isUnknown ] ])
		ifFalse: [ ^ type ].
	"infer parametric type from elements, using only generic types to avoid infinite loop"
	^ type
		asParametricType:
			{(self asOrderedCollection collect: [ :e | e class typAsType ])
				typAsType}
]
