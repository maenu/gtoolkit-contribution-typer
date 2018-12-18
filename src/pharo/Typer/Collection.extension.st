Extension { #name : #Collection }

{ #category : #'*Typer' }
Collection >> typAsType [
	<typTypeResultAs: 'TypType'>
	| remains current nullable_ unknown |
	remains := ((self "typParameters TypType")
		flatCollect: [ :e | 
			e isUnion
				ifTrue: [ (e "typCastAs TypUnionType") types ]
				ifFalse: [ {e} ] ]) asSet.
	unknown := remains includes: TypUnknownType instance.
	nullable_ := remains includes: TypNilType instance.
	((unknown and: nullable_) and: [ remains size = 2 ])
		ifTrue: [ "nullable and unknown means union"
			^ TypUnionType new
				types: remains;
				yourself ].
	nullable_
		ifTrue: [ remains remove: TypNilType instance.
			remains ifEmpty: [ "only nullable means nullable" ^ TypNilType instance ] ].
	remains size = 1
		ifTrue: [ current := remains anyOne.
			nullable_
				ifTrue: [ current := current copy.
					current nullable: true ].
			^ current ].
	^ TypUnionType new
		types: remains;
		nullable: nullable_;
		yourself
]
